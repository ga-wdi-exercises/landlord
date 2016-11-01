require "active_record"
require "pry"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "db/connection"

require "sinatra"
require "sinatra/reloader"



get '/apartments' do
  @apartments = Apartment.all
  erb :'apartments/index'
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :'apartments/show'
end
