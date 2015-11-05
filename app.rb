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

get '/apartments/:id' do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  @tenants = @apartment.tenants
  erb :"apartments/info"
end

post '/apartments' do
  address = params[:address]
  beds = params[:num_beds]
  baths = params[:num_baths]
  rent = params[:monthly_rent]
  Apartment.create(address:address,num_beds:beds,num_baths:baths,monthly_rent:rent)

  redirect '/apartments'
end
