using Test


@testset "_dbconnect function for SQLite" begin

    conn= _dbconnect(SQLite.DB, "DBConnector/DBConnector.jl/test/data/SQLite.db")
    @test @isdefined conn

end
