using Test
using MySQL,SQLite, MySQL.API




@testset "_dbconnect function for SQLite" begin

    conn= _dbconnect(SQLite.DB, "DBConnector.jl/test/data/sqlite.db")
    @test @isdefined conn

end
 
@testset "_dbconnect function for MySQL" begin
    
    conn = _dbconnect(MySQL.Connection, mysqlhost, mysqluser,mysqlpassword, db="MySQL", port=mysqlport)

    @test typeof(conn) == MySQL.Connection
    @test isopen(conn)
    close(conn)

end

@testset "_dbconnect function for LibPQ" begin

    #conn = LibPQ.Connection("postgresql://postgres:postgres3@localhost:5432/mimic?user=postgres")
    conn= _dbconnect(LibPQ.Connection,  postgreshost, postgresuser, postgrespassword, db = "mimic", port=postgresport)
    @test @isdefined conn

end