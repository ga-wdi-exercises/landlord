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
	# @apartment = Apartment.all
	erb :apt_list
end

# - The route `GET /apartments/new` should show a form for adding a new apartment
get "/apartments/new" do
	erb :apt_new
end

new_apt = []

post "/apartments/1/tenants/new" do
	@new_apt.push(params[:address], [:monthly_rent.to_i], [:sqft.to_i], [:num_beds.to_i], [:num_baths.to_i])
	@apt_submitted = true
	erb :tenant_new
end

# - The route `GET /apartments/1` should show info about a single apartment
#   * Tell the user the address, monthly_rent, sqft, num_beds, num_baths, and renters
# get "/apartments/:apt_id" do
get "/apartments/1" do
	# @apt_info = Apartment.find(params[:apt_id])
	erb :apt_info
end

# - The route `GET /apartments/1/tenants` should list all tenants for 1 apartment.
# get "/apartments/:apt_id/tenants" do
get "/apartments/1/tenants" do
	# @apt_tenants = Apartment.find(params[:apt_id]).tenants
	erb :apt_tenants
end

# - The route `GET /apartments/1/tenants/new` should show a form for adding a new tenant.
#   * Make sure to get the appropriate input from the user to create your person as per schema
# get "/apartments/:apt_id/tenants/new" do
get "/apartments/1/tenants/new" do
	erb :tenant_new
end

new_tenant = []

post "/apartments/1/tenants/new" do
	@new_tenant.push(params[:name], [:age.to_i], [:gender], [:apartment_id.to_i])
	@tenant_submitted = true
	erb :tenant_new
end