using Test, Example

@test hello("Julia") == "Hello, Julia"
@test domath(2.0) ≈ 7.0

@testset "_dbconnect function for SQLite" begin

    conn= _dbconnect(SQLite.DB, "DBConnector.jl/test/data/database.db")
    @test @isdefined conn

end
