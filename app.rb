require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "sinatra" # for sinatra
require "sinatra/reloader" # autoreloads sinatra page
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging
require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/apartment" # require the Apartment class definition that we defined in the models/apartment.rb file
require_relative "models/tenant" # require the Tenant class file

#sinatra layout stuff
get '/' do
  erb :"index"
end

# get the apartments href. Took me a couple hours to figure out you have to wrap "apartments/index" in quotes to get it to work. Funny because erb :index works without quotes, but whatever.
get '/apartments' do
  erb :"apartments/index"
end

get '/apartments/:id' do
  erb :"apartments/1"
end

get '/apartments/new' do
  erb :"apartments/new"
end

get '/apartments/:id/tenants' do
  erb :"tenants/index"
end

# This will put us into a state of the pry REPL, in which we've established a connection
# with the wdi database and have defined the Student Class as an
# ActiveRecord::Base class.
# binding.pry
