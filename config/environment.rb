require 'sinatra'
require 'grape'
require 'grape-entity'

# Models & DB
require './config/db'
require './app/models/playlist'
require './app/models/mapper'

# Controllers
require './app/api/entities/playlist'
require './app/api/playlists'
require './app/api/api.rb'
