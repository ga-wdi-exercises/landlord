require 'uri'
require 'httparty'

require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection" 
require_relative "models/apartment" 
require_relative "models/tenant"
# binding.pry

get "/" do
	erb :index	
end

# - The route `GET /apartments` should list all apartments
get "/apartments" do
	@all_apt = Apartment.all
	erb :apt_list
end

get "/apartments/:id" do
	@apt = Apartment.find(params[:id])
	erb :apt_info
end

# - The route `GET /apartments/new` should show a form for adding a new apartment
get "/apartment_new" do
	erb :apt_new
end

post "/apartments" do
  @address = params[:address]
  @monthly_rent = params[:monthly_rent].to_i
  @sqft = params[:sqft].to_i
  @num_beds = params[:num_beds].to_i
  @num_baths = params[:num_baths].to_i
  Apartment.create(address: @address, monthly_rent: @monthly_rent, sqft: @sqft, num_beds: @num_beds, num_baths: @num_baths)
  @id = Apartment.last.id
  redirect "/apartments/#{@id}"
end

post "/new_tenant/:id" do
	@id = params[:id]
	@name = params[:name]
	@age = params[:age].to_i
	@gender = params[:gender]
	Tenant.create(name: @name, age: @age, gender: @gender, apartment_id: @id)
	redirect "/apartments/#{@id}"
end

# - The route `GET /apartments/1/tenants` should list all tenants for 1 apartment.
get "/apartments/:id/tenants" do
	@id = params[:id]
	erb :apt_tenants
end

get "/new_tenant/:id" do
	@id = params[:id]
	erb :tenant_new
end

get "/tenant_details/:id" do
	@apt = Apartment.find(params[:id])
	erb :tenant_details
end

get "/apt_edit/:id" do
	@apt = Apartment.find(params[:id])
	erb :apt_edit
end

put "/apt_edit/:id" do
    @id = params[:id]	
    @apt = Apartment.find(@id)
	@address = params[:address]
	@monthly_rent = params[:monthly_rent].to_i
	@sqft = params[:sqft].to_i
	@num_beds = params[:num_beds].to_i
	@num_baths = params[:num_baths].to_i
	@apt.update(address: @address, monthly_rent: @monthly_rent, sqft: @sqft, num_beds: @num_beds, num_baths: @num_baths)
	redirect "/apartment/#{@id}"
end

delete "/apt_edit/:id" do
 @id = params[:id]
 @apt = Apartment.find(@id)
 @apt.destroy
 redirect "/apartments"
end
