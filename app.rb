require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pg'
require_relative 'db/connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

get "/" do
  @apartments = Apartment.all
  erb :"index"
end

get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments_all"
end

get "/apartments/:id" do
  @apartments = Apartment.find(params[:id])
  erb :"apartments"
end

get "/apartments/new" do
  erb :"apartments_new"
end

get "/apartments/:id/tenants" do
  @apartments = Apartment.find(params[:id])
  @tenants = Tenant.find(params[:id])
  erb :apartment_tenants
end

get "/tenants" do
  @tenants = Tenant.all
  erb :"tenants_all"
end

get "/tenants/:id" do
  @atenants = Tenant.find(params[:id])
  erb :"tenants"
end
