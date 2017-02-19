require 'pry'
require 'active_record'

## Connect to the database
require_relative 'db/connection'

# Load models
require_relative 'models/apartment'
require_relative 'models/tenant'

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :"index"
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

post '/apartments/new' do
  Apartment.create(address:params[:apartmentAddress], monthly_rent:params[:apartmentMonthlyRent], sqft:params[:apartmentSqft], num_beds:params[:apartmentNumBeds], num_baths:params[:apartmentNumBaths])
  redirect "/apartments"
end

get '/apartments/:id/tenants' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/tenants"
end

post '/apartments/:id/tenants/new' do
  Tenant.create(name:params[:tenantName] , age:params[:tenantAge] , gender:params[:tenantGender], apartment_id:params[:id] )
  redirect "/apartments/#{params[:id]}/tenants"
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @apartment = Apartment.find(@tenant.apartment)
  erb :"tenants/show"
end



# The route GET /apartments/1/tenants/new should show a form for adding a new tenant.
# Make sure to get the appropriate input from the user to create your person as per schema
