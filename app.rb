require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/apartment' do
  @apartment = Apartment.all
  erb :"apartment/index"
end

get '/apartment/new' do
  erb :"apartment/new"
end

post '/apartment' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartment/#{@apartment.id}"
end

get "/apartment/:id/edit" do
  @apartment = Apartment.find(params[:id])
  erb(:"apartment/edit")
end

put '/apartment/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect ("/apartment/#{@apartment.id}")
end

get '/apartment/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartment/show"
end

delete "/apartment/:id" do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect("/apartment")
end

get '/tenant' do
  @tenant = Tenant.all
  erb :"tenant/index"
end

get '/tenant/new' do
  erb :"tenant/new"
end

post '/tenant' do
  @tenant = Tenant.create(params[:tenant])
  redirect "/tenant/#{@tenant.id}"
end

get "/tenant/:id/edit" do
  @tenant = Tenant.find(params[:id])
  erb(:"tenant/edit")
end

put '/tenant/:id' do
  @tenant = Tenant.find(params[:id])
  @tenant.update(params[:tenant])
  redirect ("/tenant/#{@tenant.id}")
end

get '/tenant/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenant/show"
end

delete "/tenant/:id" do
  @tenant = Tenant.find(params[:id])
  @tenant.destroy
  redirect("/tenant")
end
