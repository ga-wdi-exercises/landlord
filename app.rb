require "sinatra"
require "active_record"
require "pry"

require_relative "models/apartment"
require_relative "models/tenant"
require_relative "db/connection"

get '/' do
  "Home page"
  erb :index
end

get '/apartments' do
  "Hello Apartments"
  @apartments = Apartment.all
  erb :'/apartments/index'
end

get '/apartments/new' do
  erb :'/apartments/new'
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"/apartments/show"
end

post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
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
  redirect "/tenants/#{@song.id}"
end

delete '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @tenant.destroy
  redirect("/tenants")
end
