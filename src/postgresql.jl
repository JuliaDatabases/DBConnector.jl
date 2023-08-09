"""
Dispatch for LibPQ interface to DBInterface `connect` function; not supported in LibPQ.jl package currently
"""
DBInterface.connect(::Type{LibPQ.Connection}, args...; kws...) =
    LibPQ.Connection(args...; kws...)

function _dbconnect(conn_obj::Type{LibPQ.Connection}; kwargs...)
    conn_string = ""
    for k in kwargs 
        conn_string = conn_string * "$(string(k.first))=$(k.second) "
    end

    conn_string = strip(conn_string)

    return DBInterface.connect(conn_obj, conn_string)

end

function _dbconnect(conn_obj::Type{LibPQ.Connection}, conn_string :: String)
    
    return DBInterface.connect(conn_obj, conn_string)

end

function _dbconnect(conn_obj::Type{LibPQ.Connection}, host::String, user::String, password::String; db::String="", port::Integer=3306, unix_socket::Union{Nothing,String}=nothing, client_flag=API.CLIENT_MULTI_STATEMENTS, opts = Dict())

    if unix_socket == nothing
        unix_socket = API.MYSQL_DEFAULT_SOCKET
    end

    conn_string = "postgersql://$(user):$(password)@$(host)/$(db)?user=$(user)"

    return DBInterface.connect(conn_obj, conn_string)

end
#= 

function _dbconnect(conn_obj::Type{LibPQ.Connection}; host::String, user::String, password::String; db::String="", port::Integer=5432, unix_socket::Union{Nothing,String}=nothing, client_flag=API.CLIENT_MULTI_STATEMENTS, opts = Dict())

    """
    BUG DESCRIPTION:

    As of now, this function does not work. the conn_string is not built correctly and you'd probably need to build it manually with string interpolations. 

    What this function would do is construct a connection string that looks like:

    "host = /var/run/postgresql user = user password = password dbname = mimiciii"

    However, the problem with the postgresql connection string is that the keywords in the string are actually positionally dependent. You can't just put them in any order.
    """


    conn_string = ""
    for k in kws
        conn_string = conn_string * "$(string(k.first))=$(k.second) "
    end

    conn_string = strip(conn_string)

    return DBInterface.connect(conn_obj, conn_string)

end

=#

"""
Workaround for LibPQ interface to DBInterface's `prepare` function; not supported in LibPQ.jl package currently
"""
DBInterface.prepare(conn::LibPQ.Connection, args...; kws...) =
    LibPQ.prepare(conn, args...; kws...)

"""
Workaround for LibPQ interface to DBInterface's `execute` function; not supported in LibPQ.jl package currently
"""
DBInterface.execute(conn::Union{LibPQ.Connection, LibPQ.Statement}, args...; kws...) =
    LibPQ.execute(conn, args...; kws...)


