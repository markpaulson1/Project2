require "pg"


    configure :development do
      $db = PG.connect dbname: "newdads", host: "localhost"
      register Sinatra::Reloader
    end

    configure :production do
      require 'uri'
      uri = URI.parse ENV["DATABASE_URL"]
      $db = PG.connect dbname: uri.path[1..-1],
                         host: uri.host,
                         port: uri.port,
                         user: uri.user,
                     password: uri.password
    end