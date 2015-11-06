require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require "sinatra"
require "sinatra/reloader"

require_relative "../db/connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get "/apartments/new" do
  erb :"apartments/new"
end

post "/apartments/new" do
  @address = params[:address]
  @rent = params[:rent].to_i
  @sqft = params[:sqft].to_i
  @beds = params[:beds].to_i
  @bath = params[:baths].to_i
  new_apt = Apartment.create(address: "#{@address}", monthly_rent: @rent, sqft: @sqft, num_beds: @num_beds, num_baths:@num_baths)
  redirect "/apartments"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenants = Tenant.where(apartment_id: params[:id])
  erb :"apartments/show"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

put '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  @address = params[:address]
  @monthly_rent = params[:monthly_rent]
  @sqft = params[:sqft]
  @num_beds = params[:num_beds]
  @num_baths = params[:num_baths]
  @apartment.update(address: "#{@address}", monthly_rent: "#{@monthly_rent}", sqft: "#{@sqft}", num_beds: "#{@num_beds}", num_baths: "#{@num_baths}")
  erb :"apartments/show"
end
