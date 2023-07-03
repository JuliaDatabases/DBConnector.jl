using Test, DataFrames, SQLite
using MySQL,SQLite, MySQL.API, LibPQ


include("../src/sqlite.jl")
include("../src/mysql.jl")
include("../src/postgresql.jl")

@testset "_dbconnect function for SQLite" begin

    conn= _dbconnect(SQLite.DB, "../test/data/sqlite.db")
    @test @isdefined conn
    output = DBInterface.execute(conn, "SELECT age FROM PERSON WHERE name = 'John Doe'") |> DataFrame
    out = output[1,1]
    expected_output = 30;
    @test out == expected_output

end

@testset "_dbconnect function for MySQL" begin
    
    conn = _dbconnect(MySQL.Connection, ENV['MYSQL_HOST'], ENV['MYSQL_USER'], ENV['MYSQL_PASSWORD'], db="MySQL")

    @test typeof(conn) == MySQL.Connection
    @test isopen(conn)
    close(conn)

end

@testset "_dbconnect function for LibPQ" begin

    conn= _dbconnect(LibPQ.Connection,  ENV['POSTGRES_HOST'], ENV['POSTGRES_USER'], ENV['POSTGRES_PASSWORD'], db = "mimic")
    @test @isdefined conn

end