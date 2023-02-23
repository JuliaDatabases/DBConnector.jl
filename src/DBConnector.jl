module DBConnector

using DBInterface
using LibPQ
using SQLite
using ODBC
using JDBC
using MySQL

include("postgresql.jl")
include("sqlite.jl") 
include("mysql.jl")
include("odbc.jl")
include("jdbc.jl")

function DBConnection(dbms; kws...)

    if lowercase(dbms) == "postgresql"
        return _dbconnect(LibPQ.Connection; kws...)
    elseif lowercase(dbms) == "sqlite"
        return _dbconnect(SQLite.DB; kws...)
    elseif lowercase(dbms) == "mysql"
        return _dbconnect(MySQL.Connection; kws...)
    end

end

function DBConnection(;driver_path, connection_string, connectivity, kws...)

    if lowercase(connectivity) == "odbc"
        _odbcconnect(connection_string, ; kws...)
    elseif lowercase(connectivity) == "jdbc"
        _jdbcconnect(driver_path, connection_string, ; kws...)
    else 
        println("Connection not made; please specify if this is an JDBC or ODBC connection")
    end
end

export DBConnection

end
