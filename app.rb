require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pg'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/apartments/new' do
  @apartments = Apartment.all
  erb :"/apartments/new"
end

post '/new_apartment' do
  Apartment.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_baths])
  redirect "/apartments"
end


get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"/apartments/edit"
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect '/apartments/' + @apartment.id.to_s
end


get '/apartments/:id/delete' do
  @apartment = Apartment.find(params[:id])
  erb :"/apartments/delete"
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy!
  redirect "/apartments"
end


get '/apartments' do
  @apartments = Apartment.all
  erb :"/apartments/index"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :"/apartments/show"
end
