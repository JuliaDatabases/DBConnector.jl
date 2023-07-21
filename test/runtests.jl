using Test
using DataFrames
using SQLite
using MySQL
using SQLite
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

    conn= DBConnector._dbconnect(LibPQ.Connection,  host = ENV["POSTGRES_HOST"], user = ENV["POSTGRES_USER"], dbname = "mimic", password = ENV["POSTGRES_PASSWORD"])
    @test @isdefined conn

end
