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

get '/apartments/:id' do
  @id = params[:id]
  @apartment = Apartment.find(@id)
  @tenants = @apartment.tenants
  erb :"apartments/apt"
end
