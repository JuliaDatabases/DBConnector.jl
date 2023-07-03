# SQLite Connection Tutorial 

```@contents
Pages = ["SQLite.md"]
```

This tutorial presents a step by step guide on using DBConnector to connect a SQLite database.

### Prerequisites

Basic knowledge of Julia (such as installing packages into environments and working with the Julia REPL and Julia files) is necessary; you can learn all [that here](https://pkgdocs.julialang.org/v1/getting-started/).

Get your database's file path

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
conn= _dbconnect(SQLite.DB, "../test/data/sqlite.db")
```
Now you are connected! and if the file wasn't exist it will be created!

Note: It produces error only in case the path is incorrect

### Packages Used in Analysis

Package descriptions:

- [`SQLite`](https://github.com/JuliaDatabases/SQLite.jl) - A Julia interface to the SQLite library