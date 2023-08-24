# PostgreSQL Connection Tutorial 

```@contents
Pages = ["PostgreSQL.md"]
```

This tutorial presents a step by step guide on using DBConnector to connect to PostgreSQL database using LibPQ library.

### Prerequisites

Basic knowledge of Julia (such as installing packages into environments and working with the Julia REPL and Julia files) is necessary; you can learn all [that here](https://pkgdocs.julialang.org/v1/getting-started/).

Get your database's :

        1- username
        2- password
        

        optional:
        - host
        - Database name
        - port (5432 by default)

Note: If you have additional keys that are necessary to be added, Jump to Method 2: 

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

conn= _dbconnect(LibPQ.Connection; host = host, user = user, password = password, db=db)

```
In case you want to use the optional strings:

```
using DBConnector

conn= _dbconnect(LibPQ.Connection; host = host, user = user, password = password, db="the database name", port = 5432)

```



Now you are connected!

Note: It produces error only in case the path is incorrect credentials

# Method 2

create your own connection string as this example:

```
connection_string = "postgresql://username:password@unix:/path/to/socket/directory/database_name"

conn= _dbconnect(LibPQ.Connection, connection_string)
```

### Packages Used in Analysis

Package descriptions:

- [LibPQ](https://github.com/chris-b1/LibPQ.jl#dbinterface) - A Julia interface to the LibPQ library