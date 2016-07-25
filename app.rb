require "bundler/setup"
require "pg"
require "active_record"
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/' do
  erb :index
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartment/index"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartment/show"
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenant/index"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenant/show"
end
