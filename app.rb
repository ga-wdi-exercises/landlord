require "pry"
require "sinatra"
# require "sinatra/reloader"
require "active_record"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get "/" do
  redirect to ("/apartments")
end

get "/apartments" do
  @apartments = Apartment.all
  erb :index
end

get "/apartments/new" do
  erb :new
end

get "/apartments/:id" do
  @apartment = Apartment.find_by(id: params[:id])
  @tenants = @apartment.tenants
  erb :show
end

get "/apartments/:id/edit" do
  erb :edit
end
