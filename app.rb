require "pry"
require "sinatra"
# require "sinatra/reloader"
require "active_record"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get "/" do
  redirect to "/apartments"
end

# index
get "/apartments" do
  @apartments = Apartment.all
  erb :index
end

# new
get "/apartments/new" do
  erb :new
end

# create
post "/apartments" do
  new_apt = Apartment.create(params[:apartment])
  redirect to ("/apartments/#{new_apt.id}")
end

# show
get "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :show
end

# edit
get "/apartments/:id/edit" do
  @apartment = Apartment.find(params[:id])
  erb :edit
end

# update
put "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect to ("/apartments/#{@apartment.id}")
end

# destroy
delete "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect to ("/apartments")
end
