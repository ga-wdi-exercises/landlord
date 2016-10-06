require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative "db/connection"
# require_relative "models/apartment"
# require_relative "models/tenant"


# Load Routes
get '/apartments' do
	# @apartments = Apartment.all
	erb :'apartments/index'
end

get '/apartments/new' do
	erb :'apartments/new'
end

get '/apartments/:id' do
	# @apartment = Apartment.find params[:id]
	erb :'apartments/show'
end

get '/apartments/:id/tenants' do
	# @apartment = Apartment.find params[:id]
	erb :'apartments/show-tenants'
end

get '/apartments/:id/tenants/new' do
	# @apartment = Apartment.find params[:id]
	erb :'apartments/new-tenant'
end
