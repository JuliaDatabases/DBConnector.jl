module DBConnector

using DBInterface
using LibPQ
using SQLite
using MySQL

include("postgresql.jl")
include("sqlite.jl") 
include("mysql.jl")

function DBConnection(dbms; kws...)

    if lowercase(dbms) == "postgresql"
        return _dbconnect(LibPQ.Connection; kws...)
    elseif lowercase(dbms) == "sqlite"
        return _dbconnect(SQLite.DB; kws...)
    elseif lowercase(dbms) == "mysql"
        return _dbconnect(MySQL.Connection; kws...)
    end

end

export DBConnection

end
