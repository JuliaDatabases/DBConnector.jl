# MySQL Connection Tutorial 

```@contents
Pages = ["MySQL.md"]
```

This tutorial presents a step by step guide on using DBConnector to connect a MySQL database.

### Prerequisites

Basic knowledge of Julia (such as installing packages into environments and working with the Julia REPL and Julia files) is necessary; you can learn all [that here](https://pkgdocs.julialang.org/v1/getting-started/).

Get your database's :

        1- username
        2- password
        3- host
        5- Database name

        optional:
        - port (3306 by default)
        - unix_socket 
        - client_flag
        - opts=opts 


## Environment Set-Up 

For this tutorial, you will need to activate an environment; to get into package mode within your Julia REPL, write `]`:

```julia-repl
pkg> activate TUTORIAL
```


### Packages 



You will need the following packages for this tutorial which you can install in package mode:

"]" sets package mode

```julia-repl
TUTORIAL> add DBConnector
```

"Backspace" to return to Julia mode

```
using DBConnector

conn= _dbconnect(MySQL.Connection, host, user, password, db=db)

```
In case you want to use the optional strings:

```
using DBConnector

conn= _dbconnect(MySQL.Connection, host, user, password, db="the database name", port = 3306, unix_socket=unix_socket, client_flag=client_flag, opts=opts )

```

Now you are connected!

Note: It produces error only in case the path is incorrect credentials

### Packages Used in Analysis

Package descriptions:

- [`SQLite`](https://github.com/JuliaDatabases/SQLite.jl) - A Julia interface to the SQLite library