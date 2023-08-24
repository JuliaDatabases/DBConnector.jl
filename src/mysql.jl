function _dbconnect(conn_obj::Type{MySQL.Connection}; kwargs...)


    if haskey(kwargs, :host) && haskey(kwargs, :user) 
        host = kwargs[:host]
        kwargs = filter(kvp -> first(kvp) != :host, kwargs)
        user = kwargs[:user]
        kwargs = filter(kvp -> first(kvp) != :user, kwargs)
        if isempty(kwargs)
            return DBInterface.connect(conn_obj,host, user)
        elseif haskey(kwargs, :password)
            password=kwargs[:password]
            kwargs = filter(kvp -> first(kvp) != :password, kwargs)
            if isempty(kwargs)
                return DBInterface.connect(conn_obj,host, user, password)
            elseif haskey(kwargs, :db)
                db = kwargs[:db]
                kwargs = filter(kvp -> first(kvp) != :db, kwargs)
                if isempty(kwargs)
                    return DBInterface.connect(conn_obj,host, user, password; kwargs)
                elseif haskey(kwargs, :port)
                    db = kwargs[:port]
                    kwargs = filter(kvp -> first(kvp) != :port, kwargs)
                    if isempty(kwargs)
                        return DBInterface.connect(conn_obj,host, user; kwargs)
                    end
                end
            end
        elseif haskey(kwargs, :db)
            db = kwargs[:db]
            kwargs = filter(kvp -> first(kvp) != :db, kwargs)
            if isempty(kwargs)
                return DBInterface.connect(conn_obj,host, user; kwargs)
            elseif haskey(kwargs, :port)
                db = kwargs[:port]
                kwargs = filter(kvp -> first(kvp) != :port, kwargs)
                if isempty(kwargs)
                    return DBInterface.connect(conn_obj,host, user; kwargs)
                end
            end
        end
                        
    else
        error("Invalid arguments, make sure that keyword user and host exists")
    end
end

   # if !haskey(kwargs, "unix_socket")
    #    unix_socket = API.MYSQL_DEFAULT_SOCKET
     #   kwargs.push(unix_socket)
    #end
"""
    if haskey(kwargs, :host) 
        
        host = kwargs[:host]
        kwargs = filter(kvp -> first(kvp) != :host, kwargs)
        if haskey(kwargs, :user) 
            user = kwargs[:user]
            kwargs = filter(kvp -> first(kvp) != :user, kwargs)
        elseif haskey(kwargs, :username) 
            user = kwargs[:username]
            kwargs = filter(kvp -> first(kvp) != :username, kwargs)
        else
            error("Invalid arguments, make sure that keyword user exists")
        end
    else
        error("Invalid arguments, make sure that keyword host exists")
    end
    if haskey(kwargs, :password)
        password=kwargs[:password]
        kwargs = filter(kvp -> first(kvp) != :password, kwargs)
    elseif isempty(kwargs)    
        return DBInterface.connect(conn_obj,host, user)
    else
        return DBInterface.connect(conn_obj,host, user; kwargs)
    end
    if isempty(kwargs)
        return DBInterface.connect(conn_obj,host, user, password)
    else
        
        return DBInterface.connect(conn_obj,host, user, password; kwargs)

    end
    return DBInterface.connect(conn_obj; kwargs...)
    #return DBInterface.connect(conn_obj,host, user, password, db=db, port=port, unix_socket=unix_socket, client_flag=client_flag, opts=opts )
end
"""