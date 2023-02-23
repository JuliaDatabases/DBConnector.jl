"""
Dispatch for JDBC interface to DBInterface `connect` function
"""
function DBInterface.connect(::Type{JDBC.Connection}, args...; connection_string, driver, kws...)
    JDBC.usedriver(driver)
    try 
        JDBC.init() 
    catch 
        println("JVM already initialized")
    end
    JDBC.Connection(connection_string)
end

"""
Dispatch for LibPQ interface to DBInterface `prepare` function
TODO: Not fully implemented yet
"""
# DBInterface.prepare(conn::JDBC.Connection, args...; kws...) =
#     JDBC.prepareStatement(conn, args...; kws...)

"""
Workaround for LibPQ interface to DBInterface's `execute` function
"""
function DBInterface.execute(conn::Union{JDBC.Connection, JDBC.JPreparedStatement}, args...; kws...)
    csr = JDBC.cursor(conn)
    JDBC.execute!(csr, args..., kws...)
    JDBC.Source(csr)
end


function _jdbcconnect(driver_path, connection_string; kws...)

    return DBInterface.connect(JDBC.Connection, driver = driver_path, connection_string = connection_string)

end

