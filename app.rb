require "sinatra"
require "active_record"
require "pry"

require_relative "models/apartment"
require_relative "models/tenant"
require_relative "db/connection"

get '/' do
  "Home page"
  erb :index
end

get '/apartments' do
  "Hello Apartments"
  @apartments = Apartment.all
  erb :'/apartments/index'
end
