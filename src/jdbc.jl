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
    JDBC.DriverManager.getConnection(connection_string)
end

"""
Dispatch for JDBC interface to DBInterface `prepare` function
BUG: Doesn't seem to work for all JDBC versions yet
"""
function DBInterface.prepare(conn::JDBC.JavaObject{Symbol("java.sql.Connection")}, args...; kws...)
    stmt = JDBC.createStatement(conn)
    result = executeQuery(stmt, args...)
    return result
end

"""
Workaround for JDBC interface to DBInterface's `execute` function
"""
function DBInterface.execute(conn::JDBC.JavaObject{Symbol("java.sql.ResultSet")}, args...; kws...)
    JDBC.Source(conn)
end

"""
Workaround for JDBC interface to DBInterface's `execute` function
"""
function DBInterface.execute(conn::JDBC.JavaObject{Symbol("java.sql.Connection")}, args...; kws...)
    stmt = JDBC.createStatement(conn)
    result = executeQuery(stmt, args...)
    JDBC.Source(result)
end


function _jdbcconnect(driver_path, connection_string; kws...)

    return DBInterface.connect(JDBC.Connection, driver = driver_path, connection_string = connection_string)

end

