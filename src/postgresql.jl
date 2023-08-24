"""
Workaround for LibPQ interface to DBInterface's `prepare` function; not supported in LibPQ.jl package currently
"""
DBInterface.prepare(conn::LibPQ.Connection, args...; kws...) =
    LibPQ.prepare(conn, args...; kws...)


"""
Dispatch for LibPQ interface to DBInterface `connect` function; not supported in LibPQ.jl package currently
"""
DBInterface.connect(::Type{LibPQ.Connection}, args...; kws...) =
    LibPQ.Connection(args...; kws...)

    """
    This LibPQ connection function creates a connection string using 
        1- username (user)
        2- hostname (host)
        3- password
        4- database (db)
        5- port
    
        Cases handles:
            1- user and host
            2- user, host, db
            3- user, host, password
            4- user, host, password, db
            5- user, host, password, db, port
            6- user, host, db, port
    
    adding other keywords can't be handled yet
    """
    
function _dbconnect(conn_obj::Type{LibPQ.Connection}; kwargs...)

    if haskey(kwargs, :host) && haskey(kwargs, :user) 
        host = kwargs[:host]
        kwargs = filter(kvp -> first(kvp) != :host, kwargs)
        user = kwargs[:user]
        kwargs = filter(kvp -> first(kvp) != :user, kwargs)
        if isempty(kwargs)
            conn_string = "postgresql://$user@$host" 
            return DBInterface.connect(conn_obj, conn_string)
        elseif haskey(kwargs, :password)
            password=kwargs[:password]
            kwargs = filter(kvp -> first(kvp) != :password, kwargs)
            if isempty(kwargs)
                conn_string = "postgresql://$user:$password@$host"
                return DBInterface.connect(conn_obj, conn_string)
            elseif haskey(kwargs, :db)
                db = kwargs[:db]
                kwargs = filter(kvp -> first(kvp) != :db, kwargs)
                if isempty(kwargs)
                    conn_string = "postgresql://$(user):$(password)@$(host)/$(db)?user=$(user)"
                    return DBInterface.connect(conn_obj, conn_string)
                elseif haskey(kwargs, :port)
                    db = kwargs[:port]
                    kwargs = filter(kvp -> first(kvp) != :port, kwargs)
                    if isempty(kwargs)
                        conn_string = "postgresql://$user:$password@$host:$port/$db"
                        return DBInterface.connect(conn_obj, conn_string)
                    end
                end
            end
        elseif haskey(kwargs, :db)
            db = kwargs[:db]
            kwargs = filter(kvp -> first(kvp) != :db, kwargs)
            if isempty(kwargs)
                conn_string = "postgresql://$user@$host/$db"
                return DBInterface.connect(conn_obj, conn_string)
            elseif haskey(kwargs, :port)
                db = kwargs[:port]
                kwargs = filter(kvp -> first(kvp) != :port, kwargs)
                if isempty(kwargs)
                    conn_string = "postgresql://$user@$host:$port/$db"
                    return DBInterface.connect(conn_obj, conn_string)
                end
            end
                        
    else
        error("Invalid arguments, make sure that keyword user and host exist")
    end
end

end


"""
Workaround for LibPQ interface to DBInterface's `execute` function; not supported in LibPQ.jl package currently
"""
DBInterface.execute(conn::Union{LibPQ.Connection, LibPQ.Statement}, args...; kws...) =
    LibPQ.execute(conn, args...; kws...)



function _dbconnect(conn_obj::Type{LibPQ.Connection}, conn_string :: String)
    
    return DBInterface.connect(conn_obj, conn_string)

end
"""
function _dbconnect(conn_obj::Type{LibPQ.Connection}; kwargs...)
    conn_string = ""
    for k in kwargs 
        conn_string = conn_string * "(string(k.first))=(k.second) "
    end

    conn_string = strip(conn_string)

    return DBInterface.connect(conn_obj, conn_string)

end
"""