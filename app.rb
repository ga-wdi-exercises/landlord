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
  erb(:"apartmentss/edit")
end

put '/apartments/:address' do
  @apartments = Apartment.find(params[:address])
  @apartments.update(params[:apartments])
  redirect("/apartments/#{@apartments.address}")
end

# show all tenants living in apartments
# put '/apartments/:'
