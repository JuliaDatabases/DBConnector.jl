function _dbconnect(conn_obj::Type{MySQL.Connection}, host::String, user::String, password::String; db::String="", port::Integer=3306, unix_socket::Union{Nothing,String}=nothing, client_flag=API.CLIENT_MULTI_STATEMENTS, opts = Dict())

    if unix_socket == nothing
        unix_socket = API.MYSQL_DEFAULT_SOCKET
    end

    return DBInterface.connect(conn_obj,host, user, password, db=db, port=port, unix_socket=unix_socket, client_flag=client_flag, opts=opts )
end
