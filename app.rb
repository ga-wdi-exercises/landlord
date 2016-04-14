require 'bundler/setup'
require 'pg'
require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  '<a href = "/apartments">go to apartments'
end

get '/apartments' do
  "Apartments"
end
