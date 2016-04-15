require "sinatra"
require "sinatra/reloader"
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

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
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :"apartments/show"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :"apartments/edit"
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect("/apartments/#{@apartment.id}")
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect("/apartments")
end
