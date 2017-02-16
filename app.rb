require "pg"
require "active_record"
require 'pry'
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"


get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get "/apartments/:id" do
  @apartments = Apartment.find(params[:id])
  erb :"apartments/show"
end

get "/apartments/:id/tenants" do
  @tenants = Tenant.find(params[:id])
  erb :"tenants/people"
end

post "/apartments/new" do
  erb :"apartments/new"
end
