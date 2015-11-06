require 'sinatra'
require 'sinatra/reloader'
require 'bundler/setup'
require 'pg'
require 'active_record'
require 'pry'

require_relative 'apartments_controller'
require_relative 'db/connection'
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  erb :home
end
