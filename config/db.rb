require 'sqlite3'
require 'lotus/model'
require 'lotus/model/adapters/sql_adapter'

DB_CONNECTION_URI = ENV['DATABASE_URL'] || "sqlite://playlists-#{Sinatra::Application.environment}.db"
