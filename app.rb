require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative 'db/connection'

require_relative 'models/apartment'
require_relative 'models/tenant'


get '/apartments' do
  @apartments = Apartment.all
  erb :"index"
end

get '/apartments/newapt' do

  erb :"/apartment/newapt"
end

post '/apartments' do
  Apartment.create(params[:apartment])
redirect '/apartments'
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"/apartment/show"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"/apartment/edit"
end

get '/apartments/:id/delete' do
  @apartment = Apartment.find(params[:id])
  erb :"/apartment/delete"
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect '/apartments'
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  erb :"/apartment/show"
end



get '/apartments/:id/tenants' do

end

get '/apartments/:id/tenants/new' do

end
