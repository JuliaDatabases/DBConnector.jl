using Test, Example
using MySQL,SQLite, MySQL.API

@test hello("Julia") == "Hello, Julia"
@test domath(2.0) ≈ 7.0

@testset "_dbconnect function for SQLite" begin

    conn= _dbconnect(SQLite.DB, "DBConnector.jl/test/data/database.db")
    @test @isdefined conn

end
 
@testset "_dbconnect function for MySQL" begin
    
    conn = _dbconnect(MySQL.Connection, "localhost", "debian-sys-maint","HGGsOLypO2LVqq1v", db="mydatabase", port=3306, unix_socket="/var/run/mysqld/mysqld.sock")
    @test typeof(conn) == MySQL.Connection
    @test isopen(conn)
    close(conn)

end
 