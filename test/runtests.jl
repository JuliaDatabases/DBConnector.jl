using Test
using DataFrames
using SQLite
using MySQL
using LibPQ
using DBConnector

@testset "_dbconnect function for SQLite" begin

    conn= DBConnector._dbconnect(SQLite.DB, "../test/data/sqlite.db")
    @test @isdefined conn
    output = DBInterface.execute(conn, "SELECT age FROM PERSON WHERE name = 'John Doe';") |> DataFrame
    out = output[1,1]
    expected_output = 30;
    @test out == expected_output

end

@testset "_dbconnect function for LibPQ" begin

    conn= DBConnector._dbconnect(LibPQ.Connection,  ENV["POSTGRES_HOST"],ENV["POSTGRES_USER"], ENV["POSTGRES_PASSWORD"], "omop")
    @test @isdefined conn

end
"""
@testset "_dbconnect function for MySQL" begin
    
    #conn = DBConnector._dbconnect(MySQL.Connection, ENV["MYSQL_HOST"], ENV["MYSQL_USER"], ENV["MYSQL_PASSWORD"], db="MySQL")
    conn = DBConnector._dbconnect(MySQL.Connection, "199.180.155.65","fareeda", "GSoCPass"; db="MySQL")
    @test @isdefined conn
    @test typeof(conn) == MySQL.Connection
    @test isopen(conn)
    close(conn)

end

"""
