require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

# Require the connection file
require_relative 'db/connection'

# Require the models
require_relative 'models/apartment'
require_relative 'models/tenant'


get '/' do 
  @apart = '/apartments'
  @tenant = '/tenants'
  erb :'home/index'
end

get '/apartments' do
  @apartment = Apartment.all
  puts Apartment.all
  erb :"/apartments/index"
end

# create new apartment
get '/apartments/create' do
  erb :"apartments/create"
end

# individual page for the aparement
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenant = Tenant.where(apartment_id: params[:id])
  erb :"apartments/apartment_tenants"
end


# Add the new appartment
post '/apartments' do
  apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{apartment.id}"
end

# Edit an appartment
get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

# update the apartment 
put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

# Delete an apartment
delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect "/apartments"
end
  
# List out all the tenants
get '/tenants' do 
  @tenant = Tenant.all
  erb :"/tenants/index"
end 

# Add new tenant
get '/tenants/create' do
  erb :"tenants/create"
end

get '/tenants/:id' do 
  @tenant = Tenant.find(params[:id])
  @apartment_id = @tenant.apartment.id
  @apartment = Apartment.find(@apartment_id)
  erb :"/tenants/show"
end

post '/tenants' do
  tenant = Tenant.create(params[:tenant])
  redirect "/tenants/#{tenant.id}"
end

# Edit the Tenant
get '/tenants/:id/edit' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/edit"
end

# Update the tenant
put '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @tenant.update(params[:tenant])
  redirect "/tenants/#{@tenant.id}"
end

delete '/tenants/:id' do
  @tenant= Tenant.find(params[:id])
  @tenant.destroy
  redirect('/tenants')
end




