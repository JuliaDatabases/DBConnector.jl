function _odbcconnect(driver_path; kwargs...)

    ODBC.adddriver("DBDRIVER", driver_path)
    conn_string = "Driver=DBDRIVER;"
    for k in kwargs
        conn_string = conn_string * "$(string(k.first))=$(k.second);"
    end

    return DBInterface.connect(ODBC.Connection, conn_string[1:end-1])

end
