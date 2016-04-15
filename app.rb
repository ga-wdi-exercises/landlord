require "pry"
require "sinatra"
# require "sinatra/reloader"
require "active_record"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# root
get "/" do
  redirect to "/apartments"
end

################
## Apartments ##
################

# apartment index
get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments/index"
end

# apartment new
get "/apartments/new" do
  erb :"apartments/new"
end

# apartment create
post "/apartments" do
  new_apt = Apartment.create(params[:apartment])
  redirect to ("/apartments/#{new_apt.id}")
end

# apartment show
get "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :"apartments/show"
end

# apartment edit
get "/apartments/:id/edit" do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

# apartment update
put "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect to ("/apartments/#{@apartment.id}")
end

# apartment destroy
delete "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect to ("/apartments")
end

#############
## Tenants ##
#############

# tenant index (on apartment show)

# tenant new (on apartment show)
get "/tenants/new" do
  @apartments = Apartment.all
  erb :"tenants/new"
end

# tenant create
post "/tenants" do
  tens_apt = params[:apartment]
  new_tenant = tens_apt.tenants.create(params[:tenant])
  redirect to ("/apartments/#{tens_apt.id}/tenants/#{new_tenant.id}")
end

# tenant show
get "/apartments/:apartment_id/tenants/:id" do
  @tenant = Tenant.find(params[:id])
  @apartment = Apartment.find(params[:apartment_id])
  erb :"tenants/show"
end

# tenant edit
get "/apartments/:apartment_id/tenants/:id/edit" do
  @tenant = Tenant.find(params[:id])
  @apartment = Apartment.find(params[:apartment_id])
  erb :"tenants/edit"
end

# tenant update
put "/apartments/:apartment_id/tenants/:id" do
  @tenant = Tenant.find(params[:id])
  @apartment = Apartment.find(params[:apartment_id])
  @tenant.update(params[:tenant])
  redirect to ("apartments/#{@tenant.apartment.id}/tenants/#{@tenant.id}")
end

# tenant delete
delete "/apartments/:apartment_id/tenants/:id" do
  @tenant = Tenant.find(params[:id])
  @apartment = Apartment.find(params[:apartment_id])
  @tenant.destroy
  redirect to ("apartments/#{@tenant.apartment.id}")
end
