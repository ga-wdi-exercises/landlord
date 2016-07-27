require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"

require_relative "models/tenant"
require_relative 'models/apartment'


get '/' do
  redirect '/tenants'
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

# get '/apartments' do
#   @apartment = Apartment.all
#   erb :"apartments/index"
# end

get '/tenants/new' do
  erb :"tenants/new"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end

post '/tenants' do
  @tenant = Tenant.create(params[:tenant])
  redirect "/tenants/#{@tenant.id}"
end

get '/tenants/:id/edit' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/edit"
end

put '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @tenant.update(params[:tenant])
  redirect "/tenant/#{@tenant.id}"
end

delete '/tenant/:id' do
  @tenant = Tenant.find(params[:id])
  @tenant.destroy
  redirect '/tenants'
end
