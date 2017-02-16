require "sinatra"
require "sinatra/reloader"
require "active_record"
require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get "/" do

  erb :index
end

get "/apartments" do
  @apartments = Apartment.all
  erb :list_apartments
end

post "/apartments" do
  @apartment = Apartment.create!(params[:apartment])
  redirect("/apartments")
end

get "/apartments/new" do
  erb :new
end

get "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  erb :show_details
end

delete "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect("/apartments")
end
