require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/apartment' do
  @apartment = Apartment.all
  erb :"apartment/index"
end

get '/apartment/new' do
  erb :"apartment/new"
end

post '/apartment' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartment/#{@apartment.id}"
end

get '/apartment/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartment/show"
end
