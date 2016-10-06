require "sinatra"
require "sinatra/reloader"
require "active_record"

# require_relative "db/connection"
# require_relative "models/apartment"
# require_relative "models/tenant"

get '/' do
  erb :"apartments/home"
end

get '/apartments' do
  erb :"apartments/index"
end

get '/apartments/1'do
  erb :"apartments/detail"
end

get '/apartments/new' do
  erb :"apartments/new"
end

get '/apartments/1/tenants' do
  erb :"apartments/tenants"
end

# get '/apartments' do
# @apartments = Apartment.all
# erb :"apartments/index"
# end
