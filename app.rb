require "sinatra"
require "sinatra/reloader"
require "active_record"
require "pry"

require_relative "models/apartment"
require_relative "models/tenant"
require_relative "db/connection"

binding.pry
get '/' do
  "Home page"
  erb :index
end

get '/apartments' do
  @apartments = Apartment.all
  erb :'/apartments/index'
end

get '/apartments/new' do
  erb :'/apartments/new'
end

post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :"/apartments/show"
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

get '/tenants' do
  @tenants = Tenant.all
  erb :'/tenants/index'
end

get '/tenants/new' do
  erb :'/tenants/new'
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :'/tenants/show'
end

post '/tenants' do
  @tenant = Tenant.create(params[:tenant])
  redirect "/tenants/#{@tenant.id}"
end

delete '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @tenant.destroy
  redirect("/tenants")
end
