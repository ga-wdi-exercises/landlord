require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# #Load specific routes / controllers
# require_relative 'controllers/artist.rb'
# require_relative 'controllers/song.rb'

# Load models
require_relative 'models/apartment.rb'
require_relative 'models/tenant.rb'

get "/" do
  @apartments = Apartment.all
  erb :index
end

get "/apartments" do
  @apartments = Apartment.all
  erb :apartments_all
end

get "/tenants" do
  @tenants = Tenant.all
  erb :tenants_all
end

get "/apartments/add" do
  erb :apartment_new
end

get "/apartments/:id/tenants" do
  @apartments = Apartment.find(params[:id])
  @tenants = Tenant.find(params[:id])
  erb :apartment_tenants
end

get "/apartments/:id" do
  @apartments = Apartment.find(params[:id])
  erb :apartment
end

get "/tenants/:id" do
  @tenants = Tenant.find(params[:id])
  erb :tenant
end

get "/apartments/:id/tenants/new" do
  @apartments = Apartment.find(params[:id])
  erb :tenant_new
end
