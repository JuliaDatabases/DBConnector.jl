using Test, DataFrames


@testset "_dbconnect function for SQLite" begin

    conn= _dbconnect(SQLite.DB, "DBConnector/DBConnector.jl/test/data/SQLite.db")
    @test @isdefined conn
    DBInterface.execute(conn, "CREATE TABLE PERSON (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)")
    DBInterface.execute(conn, "INSERT INTO PERSON (name, age) VALUES ('John Doe', 30), ('Jane Smith', 25), ('Bob Johnson', 40)")
    output = DBInterface.execute(conn, "SELECT age FROM PERSON WHERE name = 'John Doe'") |> DataFrame
    out = output[1,1]
    expected_output = 30;
    @test out == expected_output
    db_path = "DBConnector/DBConnector.jl/test/data/SQLite.db"
    rm(db_path)

end
