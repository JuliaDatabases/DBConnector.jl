function _dbconnect(connector::Type{SQLite.DB}, file_path::String)

    return connector(file_path)
    
end
