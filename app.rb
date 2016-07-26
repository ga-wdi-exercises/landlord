require "bundler/setup"
require "pg"
require "active_record"
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

require "pry"

get '/' do
  erb :index
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
  @tenants_here = Tenant.where(apartment_id: params[:id])
  erb :"apartments/show"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

post '/apartments' do
  apt = Apartment.create(params[:apartment])
  redirect "/apartments/#{apt.id}"
end

put '/apartments/:id' do
  apt = Apartment.find(params[:id])
  apt.update(params[:apartment])
  redirect "/apartments/#{apt.id}"
end

delete '/apartments/:id' do
  apt = Apartment.find(params[:id])
  apt.destroy
  redirect '/apartments'
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/new' do

end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @residence = Apartment.find(@tenant.apartment_id)
  erb :"tenants/show"
end

get 'tenants/:id/edit' do
  
end

post '/tenants' do

end

put '/tenants/:id' do

end

delete '/tenants/:id' do

end
