require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/' do
  'mia is awesome!'
end

get '/apartments' do
  
end
