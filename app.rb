require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get "/" do
  erb (:index)
end

get "/apartments" do
  @apartments = Apartment.all
  erb :apartments
end

get "/apartments/new" do
  erb (:newapartment)
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

get "/apartments/:id" do
  erb (:apartmentdetails)
end

get "/tenants" do
  @tenants = Tenant.all
  erb (:tenants)
end

get "/tenants/new" do
  erb (:addtenant)
end

post "/tenants/new" do
  @name = params[:name]
  @age = params[:age].to_i
  @gender = params[:gender]
  new_tenant = Tenant.create(name: "#{@name}", age: @age, gender: "#{@gender}")
  redirect "/tenants"
end
