require 'sinatra'
require 'sinatra/reloader'
require 'bundler/setup'
require 'pg'
require 'active_record'
require 'pry'

require_relative 'apartments_controller.rb'
require_relative 'db/connection.rb'
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  erb :home
end
