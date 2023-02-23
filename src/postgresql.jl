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


