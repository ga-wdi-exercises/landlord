# required gem files
require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require 'sinatra'
require 'sinatra/reloader'
# required relative files
require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "controllers/apartments"
require_relative "controllers/tenants"

# general routes for sinatra
get '/' do
  erb :home
end
