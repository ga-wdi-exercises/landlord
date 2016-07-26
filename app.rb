require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  redirect '/apartment'
end

get '/apartment' do
  @apartments = Apartment.all
  erb :"apartment/index"
end

get '/apartment/new' do
  erb :"apartment/new"
end

get '/apartment/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartment/show"
end


post '/apartment' do
  @apartment = Apartment.create(params[:apartment])
 redirect "/apartment/#{@apartment.id}"
end

get '/apartment/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartment/edit"
end

put '/apartment/:id' do
  apartment = Apartment.find(params[:id])
  apartment.update(params[:apartment])
  redirect "/apartment/#{apartment.id}"
end

delete '/apartment/:id' do
  apartment = Apartment.find(params[:id])
  apartment.destroy
  redirect '/apartment'
end
