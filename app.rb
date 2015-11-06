require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/tenant"
require_relative "models/apartment"
require_relative "controllers/tenants_controller"
require_relative "controllers/apartments_controller"
# This will put us into a state of the pry REPL, in which we've established a connection
# with the wdi database and have defined the Student Class as an
# ActiveRecord::Base class.
get '/' do
  erb :home
end
