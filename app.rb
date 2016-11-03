
require "sinatra"
require "sinatra/reloader"
require "active_record"

require_relative 'db/connection'
require_relative 'models/apartment'
require_relative 'models/tenant'



get '/' do
  erb :"home"
end

get '/apartments' do
  @apartments = Apartment.all
 erb :apartments
end

get '/tenants' do
  @tenants = Tenant.all
  erb :tenants
end

get '/new' do
  erb :"new"
end

get '/apartment/new' do
  erb :"new"
end

post '/apartments' do
  Apartment.create(params[:apartment])
  redirect "/apartments"
end

get '/apartment/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"show"
end

get '/apartment/:id/edit' do
  @apartment = Apartment.find(params[id])
  erb :"edit"
end
