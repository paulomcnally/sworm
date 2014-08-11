sql = require 'mssql'

module.exports() = {
  query(query, params) =
    request = @new sql.Request(self.connection)

    if (params)
      for each @(key) in (Object.keys(params))
        request.input(key, params.(key))

    request.query (query) ^!

  connect(config) =
    self.connection := @new sql.Connection(config.config)
    self.connection.connect(^)!

  close() =
    self.connection.close()

  outputIdBeforeValues(id) = "output Inserted.#(id)"
  outputIdAfterValues(id) = ''
}
