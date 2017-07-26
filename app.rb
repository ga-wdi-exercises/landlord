require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/' do #HOME PAGE
  @tenants = Tenant.all
  @apartments = Apartment.all
  erb :"home"
end

get '/tenants' do #READ
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/new' do #CREATE
  erb :"tenants/new"
end

post '/tenants' do #CREATE
  @tenant = Tenant.create(params[:tenant])
  redirect "/tenants/#{@tenant.id}"
end

get '/tenants/:id' do #READ
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end

get '/tenants/:id/edit' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/edit"
end

put '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @tenant.update(params[:tenant])
  redirect "/tenants/#{@tenant.id}"
end

delete '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @tenant.destroy
  redirect "/tenants"
end

# get '/pokemons/:id' do #READ
#   @pokemon = Pokemon.find(params[:id])
#   erb :"pokemons/show"
# end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end
