require 'bundler/setup'
require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/apartments' do
  @apartments = Apartment.all
  erb :'apartments/index'
end


get '/apartments/new' do
  erb :'apartments/new'
end

post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

get '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  erb :'apartments/show'
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

put '/apartments/:id' do
  puts "*" * 50
  puts params
  puts "*" * 50
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect("/apartments/#{@apartment.id}")
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect("/apartments")
end
