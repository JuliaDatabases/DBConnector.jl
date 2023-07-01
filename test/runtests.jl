using Test
using MySQL,SQLite, MySQL.API




@testset "_dbconnect function for SQLite" begin

    conn= _dbconnect(SQLite.DB, "DBConnector.jl/test/data/sqlite.db")
    @test @isdefined conn

end
 
@testset "_dbconnect function for MySQL" begin
    
    conn = _dbconnect(MySQL.Connection, ENV[mysqlhost], ENV[mysqluser], ENV[mysqlpassword], db="MySQL", port=ENV[mysqlport])

    @test typeof(conn) == MySQL.Connection
    @test isopen(conn)
    close(conn)

end

@testset "_dbconnect function for LibPQ" begin

    conn= _dbconnect(LibPQ.Connection,  ENV[postgreshost], ENV[postgresuser], ENV[postgrespassword], db = "mimic", port=ENV[postgresport])
    @test @isdefined conn

end