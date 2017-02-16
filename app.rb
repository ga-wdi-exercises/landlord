require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'
require 'pg'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/apartments' do
  @apartment = Apartment.all
  erb :index
end

get '/apartments/new' do
  erb :new_a
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :show_a
end


post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

get '/apartments/:id/update' do
  @apartments = Apartment.find(params[:id])
  erb :"update"
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect "/Apartment"
end

get '/' do
  redirect '/apartments'
end
