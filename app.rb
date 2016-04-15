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
