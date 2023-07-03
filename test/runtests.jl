using Test, DataFrames, SQLite
include("../src/sqlite.jl")

@testset "_dbconnect function for SQLite" begin

    conn= _dbconnect(SQLite.DB, "../test/data/sqlite.db")
    @test @isdefined conn
    output = DBInterface.execute(conn, "SELECT age FROM PERSON WHERE name = 'John Doe'") |> DataFrame
    out = output[1,1]
    expected_output = 30;
    @test out == expected_output

end
