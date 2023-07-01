"""
Dispatch for LibPQ interface to DBInterface `connect` function; not supported in LibPQ.jl package currently
   
"""
DBInterface.connect(::Type{LibPQ.Connection}, args...; kws...) =
    LibPQ.Connection(args...; kws...)

function _dbconnect(conn_obj::Type{LibPQ.Connection}, host::String, user::String, password::String; db::String="", port::Integer=3306, unix_socket::Union{Nothing,String}=nothing, client_flag=API.CLIENT_MULTI_STATEMENTS, opts = Dict())

    conn_string = ""
    for k in kwargs 
        conn_string = conn_string * "$(string(k.first))=$(k.second) "
    end

    conn_string = strip(conn_string)

    return DBInterface.connect(conn_obj, conn_string)

end

function _dbconnect(conn_obj::Type{LibPQ.Connection},  host::String, user::String, password::String; db::String="", port::Integer=3306, unix_socket::Union{Nothing,String}=nothing,  opts = Dict())

    return DBInterface.connect(conn_obj, "postgresql://$user:$password@$host:$port/$dbname?user=$user")

end


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


    conn = LibPQ.Connection(
        host="localhost",
        port=5432,
        dbname="mimic",
        user="postgres",
        password="postgres3"
    )
    conn = LibPQ.Connection("postgresql://postgres:postgres3@localhost:5432/mimic")
]