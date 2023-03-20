# Functions

```@contents
Pages = ["Functions.md"]
```

## _dbconnect()

This Function is dedicated to expand the range of connection between The [OMOPCDMCohortCreator](https://github.com/JuliaHealth/OMOPCDMCohortCreator.jl) with databases.
Databases exist are SQLite, MySQL, PostgreSQL.
In the upcoming sections, we will learn about these tools.

### SQLite

Assuming your data exists on a SQLite database and you want to connect it to the OMOPCDMCohortCreator.

calling the function

``` _dbconnect(SQLite.Connection,"path/to/database.db") ```



### MySQL

Assuming your data exists on a MySQL database and you want to connect it to the OMOPCDMCohortCreator.

Make sure that the server is running and using `MySQL.API`:

```  systemctl status mysql ```

calling the function

``` _dbconnect(MySQL.Connection, "host_name", "username", "password"; db = "database_name" , port = port_num, unix_socket = "unix_socket_data_path" ) ```

those parameters must exist:

- host_name : if you are working on same machine server it will be "local host"

- username
- password

Can be known by openning all the `.cnf` files until you find them. I wasn't lucky and opened around 5 till I found the right one. Don't give up!

If unix_socket is not inserted, the default one is given 



For any struggles MySQL related, [Read this](https://dev.mysql.com/doc/refman/8.0/en/starting-server.html)






