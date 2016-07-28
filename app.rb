require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require 'sinatra'
require 'sinatra/reloader'
require_relative "db/connection"
require_relative 'models/apartment'
require_relative "models/tenant"


get '/' do
  redirect '/apartments'
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end



# put '/apartments/:id' do
#   @apartment = Apartment.find(params[:id])
#   @apartment.update(params[:apartment])
#   redirect "/apartment/#{@apartment.id}"
# end
#
# delete '/apartment/:id' do
#   @apartment = Apartment.find(params[:id])
#   @apartment.destroy
#   redirect '/apartments'
# end
