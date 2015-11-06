require "bundler/setup"
require 'pry'
require 'active_record'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "controllers/tenants_controller.rb"
require_relative "controllers/apartments_controller.rb"

apt_id = 0

get "/" do
  erb :index
end
