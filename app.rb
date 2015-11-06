require 'bundler/setup'
require 'pg'
require 'active_record'
require 'pry'
require 'sinatra'
require 'sinatra/reloader'

require_relative 'db/connection'
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  erb :home
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end
post '/apartments' do
  Apartment.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_baths])
  redirect "apartments"
end

get '/tenants/new' do
  erb :"tenants/new"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @residents = @apartment.tenants
  erb :"apartments/show"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end
