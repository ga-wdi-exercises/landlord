require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "pry"
require "sinatra"
require "sinatra/reloader"
require "active_record"

require_relative "db/connection"
require_relative "models/tenant"
require_relative "models/apartment"

get "/apartments" do
  @apartments = Apartment.all
  erb :"apartment/index"
end

get "/apartments/new" do
  erb :"apartment/new"
end

get "/apartments/:id/edit" do
  @apartments = Apartment.find(params[:id])
  erb :"apartment/edit"
end

put "/apartments/:id" do
  @apartments = Apartment.find(params[:id])
  @apartments.update(params[:apartment])
  redirect "/apartments"
end

get "/apartments/:id" do
  @apartments = Apartment.find(params[:id])
  @tenants = Tenant.all.where("apartment_id = #{@apartments.id}")
  erb :"apartment/show"
end

post "/apartments" do
  Apartment.create(params[:apartment])
  redirect "/apartments"
end

delete "/apartments/:id" do
  @apartments = Apartment.find(params[:id])
  @apartments.destroy
  redirect "/apartments"
end

get "/tenants" do
  @tenants = Tenant.all
  erb :"tenant/index"
end

get "/tenants/new" do
  erb :"tenant/new"
end

post "/tenants" do
  Tenant.create(params[:tenant])
  redirect "/tenants"
end

get "/tenants/:id/edit" do
  @tenants = Tenant.find(params[:id])
  erb :"tenant/edit"
end

put "/tenants/:id" do
  @tenants = Tenant.find(params[:id])
  @tenants.update(params[:tenant])
  redirect "/tenants"
end

get "/tenants/:id" do
  @tenants = Tenant.find(params[:id])
  erb :"tenant/show"
end

delete "/tenants/:id" do
  @tenants = Tenant.find(params[:id])
  @tenants.destroy
  redirect "/tenants"
end
