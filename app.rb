require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'

# for debugging
require 'pry'

#connect to db
require_relative 'db/connection'

#load models
require_relative 'models/apartment'
require_relative 'models/tenant'


#index apt
get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

#new apt
get '/apartments/new' do
  erb :"apartments/new"
end

#create apt
post '/apartments/:id' do
  Apartment.create!(params[:apartment])
  redirect '/apartments'
end

#show apt
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

#edit apt
get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

#update apt
put '/apartments/:id' do
  apartment = Apartment.find(params[:id])
  apartment.update!(params[:apartment])
  redirect "/apartments/#{apartment.id}"
end

#delete apt
delete '/apartments/:id' do
  apartment.destroy!(params[:id])
  redirect "/apartments"
end


#index tenant
get '/apartments/:id/tenants' do
  @apartment = Apartment.find(params[:id])
  erb:"tenants/index"
end

#new tenant
get '/apartments/:id/tenants/new' do
  @apartment = Apartment.find(params[:id])
  erb :"tenants/new"
end

# create tenant
post '/apartment/:id/tenants' do
  apartment = Apartment.find(params[:id])
  apartment.tenants.create!(params[:apartment])
  redirect '/apartments/#{apartment.id}/tenants'
end
