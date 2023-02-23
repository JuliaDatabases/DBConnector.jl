function _dbconnect(connector::Type{SQLite.DB}; file_path)

    return connector(file_path.second)

end
