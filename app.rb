require 'pg'
require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"


get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

post '/apartments' do
  @apartment = Apartment.create(
    address: params[:address],
    monthly_rent: params[:monthly_rent],
    sqft: params[:sqft],
    num_beds: params[:num_beds],
    num_baths: params[:num_baths]
  )
  redirect "apartments/#{@apartment.id}"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :"apartments/show"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(
    address: params[:address],
    monthly_rent: params[:monthly_rent],
    sqft: params[:sqft],
    num_beds: params[:num_beds],
    num_baths: params[:num_baths]
  )
  redirect "/apartments/#{@apartment.id}"
end

get '/apartments/:id/delete' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect "/apartments"
end
