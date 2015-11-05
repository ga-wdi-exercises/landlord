require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/tenant" # require the Student class definition that we defined in the models/student.rb file
require_relative "models/apartment"
# require_relative "db/seeds.rb"

#link to view all apartments
get '/apartments' do
  'All of our <a href = " "> Apartments</a>'
end
#view an apartments details
get 'apartments/:id' do

end
