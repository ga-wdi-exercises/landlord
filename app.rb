require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  erb :index
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :'apartments/new'
end

get '/apartments/:id' do
  @apt = Apartment.find(params[:id])
  @tenants = @apt.tenant
  erb :"apartments/show"
end

post "/apartments" do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end


get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end
