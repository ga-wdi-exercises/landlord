require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
require_relative 'models/apartment'
require_relative 'models/tenant'

get "/" do
  erb :index
end


get "/apartments" do
  @apartments = Apartment.all
  erb :apartments
end

get "/apartments/new" do
 erb :add_apt
end

post "/apartments" do
  Apartment.create(params[:apartment])
  redirect "/apartments"
end

get "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  erb :apartment_details
end

get "/apartments/:id/tenants" do
  @apartment = Apartment.find(params[:id])
  @number = @apartment.id
  @tenant = Tenant.all
  erb :tenants
end

get "/apartments/:id/tenants/new" do
  @apartment = Apartment.find(params[:id])
 erb :add_tenant
end

post "/:id/tenant" do
  Tenant.create(params[:tenant])
  redirect "/apartments/#{params[:id]}/tenants"
end

delete "/tenant/:id" do
  @tenant = Tenant.find(params[:id])
  @apartment = @tenant.apartment_id
  @tenant.destroy
  redirect "/apartments/#{@apartment}/tenants"
end

get "/tenant/:id/edit" do
  @tenant = Tenant.find(params[:id])
  erb :edit_tenant
end

put "/tenant/:id" do
  @tenant = Tenant.find(params[:id])
  @tenant.update(params[:tenant])
  redirect "/apartments/#{@tenant.apartment_id}/tenants"
end



#
# get "/apartments/new" do
#
# end
