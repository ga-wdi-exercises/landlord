require 'sinatra'
require 'sinatra/reloader'
require "bundler/setup"
require "pg"
require "pry"
require "active_record"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# Home
get "/" do
  erb :"index"
end

# Show all apartments
get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments/index"
end

# Add apartment
get "/apartments/new" do
  erb :"apartments/new"
end

# Post new apartment form
post '/apartments' do
  @new_apt = Apartment.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_beds])
  redirect '/apartments/' + @new_apt.id.to_s
end

# Show apartment details by id
get "/apartments/:apt_id" do
  @apartments = Apartment.all
  @apt_id = params[:apt_id].to_i
  @apt_details = Apartment.find(@apt_id)
  erb :"apartments/show"
end

# Edit apartment details

# Delete apartment
delete "/apartments/:apt_id" do
  Apartment.destroy(params[:apt_id])
  redirect "/apartments"
end

# Show all tenants
get "/tenants" do
  @tenants = Tenant.all
  erb :"tenants/index"
end

# Add Tenant
get "/tenants/new" do
  erb :"tenants/new"
end

# Post new tenant form
post '/tenants' do
  @new_tenant = Tenant.create(name: params[:name], age: params[:age], gender: params[:gender])
  redirect '/tenants/' + @new_tenant.id.to_s
end

get "/tenants/:tenant_id" do
  @tenants = Tenant.all
  @tenant_id = params[:tenant_id].to_i
  @tenant_details = Tenant.find(@tenant_id)
  erb :"tenants/show"
end
