require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pg'
require 'pry'
require 'bundler/setup'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/' do
  redirect '/apartments'
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenant = Tenant.find(params[:id])
  erb :"apartments/show"
end

get '/tenants/:id' do
  @apartment = Aparment.find(params[:id])
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end
