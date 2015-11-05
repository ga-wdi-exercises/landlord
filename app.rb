require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartments"
require_relative "models/tenants"
require_relative "controllers/apartment_controller.rb"

get "/" do
  erb :index
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get "/apartments/:id/edit" do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  erb :"apartments/edit"
end

get "/apartments/:id/remove" do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  erb :"apartments/remove"
end

get '/apartments/:id' do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  @tenants = @apartment.tenants
  erb :"apartments/info"
end

get '/apartments/:id/tenants' do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  @tenants = @apartment.tenants
  erb:"tenants/info"
end

get '/apartments/:id/tenants/new' do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  erb:"tenants/new"
end

post '/apartments' do
  address = params[:address]
  beds = params[:num_beds]
  baths = params[:num_baths]
  rent = params[:monthly_rent]
  Apartment.create(address:address,num_beds:beds,num_baths:baths,monthly_rent:rent)
  redirect '/apartments'
end

put '/apartments/:id' do
  id = params[:id]
  address = params[:address]
  beds = params[:num_beds]
  baths = params[:num_baths]
  rent = params[:monthly_rent]
  apartment = Apartment.find(id)
  apartment.update(address:address,num_beds:beds,num_baths:baths,monthly_rent:rent)
  redirect "/apartments/#{id}"
end

delete '/apartments/:id' do
  id = params[:id]
  apartment = Apartment.find(id)
  apartment.destroy
  redirect "/apartments"
end

post '/apartments/:id/tenants' do
  name = params[:name]
  gender = params[:gender]
  age = params[:age]
  apartment_id = params[:id]
  Tenant.create(name:name,gender:gender,age:age,apartment_id:apartment_id)
  redirect "/apartments/#{apartment_id}/tenants"
end
