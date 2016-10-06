require "sinatra"
require "sinatra/reloader"
require "active_record"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index1"
  # redirect "/apartments/new"
end

get '/apartments/new' do
  erb :"apartments/new1"
end

get '/apartments/:id/edit' do
  @apartments = Apartment.find(params[:id])
  erb :"apartments/edit1"
end

put '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  @apartments.update(params[:apartments])
  redirect "/apartments/#{@apartments.id}"
end

post '/apartments' do
  @apartments = Apartment.create(params[:apartments])
  puts params
  redirect "/apartments/#{@apartments.id}"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show1"
end

delete '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  @apartments.destroy
  redirect "/apartments"
end
