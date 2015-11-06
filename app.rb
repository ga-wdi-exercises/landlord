require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging
require 'sinatra'
require 'sinatra/reloader'

# Connect to DB
require_relative "db/connection"

# Load specific routes / controllers
require_relative "controllers/apartments.rb"
require_relative "controllers/tenant.rb"

# Load models
require_relative "models/apartment"
require_relative "models/tenant"

# Home
get "/" do
  erb :"index"
end
