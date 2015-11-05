require 'sinatra'
require 'sinatra/reloader'
require "bundler/setup"
require "pg"
require "pry"
require "active_record"

# Connect to DB
require_relative "db/connection"

# Load specific routes / controllers
require_relative "controllers/apartments.rb"
require_relative "controllers/tenants.rb"

# Load models
require_relative "models/apartment"
require_relative "models/tenant"

# Home
get "/" do
  erb :"index"
end
