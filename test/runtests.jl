using Test


@testset "_dbconnect function for SQLite" begin

    conn= _dbconnect(SQLite.DB, "DBConnector.jl/test/data/database.db")
    @test @isdefined conn

end
