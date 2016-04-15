require "sinatra/reloader"
require "sinatra"
require "active_record"

# look for a gem so I Can use that in this file
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "db/connection"
# look for a file nearby

# address = []

get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments/index"
end

# create apartments
post '/apartments' do
  @apartment = Apartment.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_baths])
  erb :"/apartment/new"
  redirect "/apartments/#{@apartment.id}"
end

# delete apartments
delete '/apartments/:address' do
  @apartments = Apartment.find(params[:address])
  @apartments.destroy
  redirect("/apartments")
end

# edit apartments
get "/apartments/:address/edit" do
  @apartments = Apartment.find(params[:address])
  erb :"apartmentss/edit"
end

# update apartements
put '/apartments/:address' do
  @apartments = Apartment.find(params[:address])
  @apartments.update(params[:apartments])
  redirect("/apartments/#{@apartments.address}")
end

# show all tenants living in apartments
post '/apartments' do
  @tenant = Tenant.all "/tenants/#{@tenant.id}"
  erb :"/apartments/index"
end

#
get '/apartments' do
  @apartments = Apartment.create(params[:apartments])
  redirect "/apartments/#{@apartments.id}"
  erb :"apartments/index"
end


post '/apartments/new' do
  @apartments = Apartment.create(params[:apartments])
  redirect "/apartments/#{@apartments.id}"
end


get "/apartments/:id/edit" do
  @apartments = Apartment.find(params[:id])
  erb(:"apartments/edit")
end

put '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  @apartments.update(params[:id])
  redirect("/apartments/#{@apartments.id}")
end
