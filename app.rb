require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pg'
require_relative 'db/connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

get "/apartments" do
  @apartments = Apartment.all
  erb :"index"
end

get "/apartments/:id" do
  @apartments = Apartment.find(params[:id])
  erb :"apartments"
end

get "/apartments/new" do
  erb :"apartments_new"
end

post "/apartments" do
  @apartments = Apartment.create({address: params[:address],
                                  monthly_rent: params[:monthly_rent],
                                  sqft: params[:sqft],
                                  num_beds: params[:num_beds],
                                  num_baths: params[:num_baths]})
  redirect "/apartments/#{@apartments.id}"
end

delete '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  @apartments.destroy
  redirect ("/pokemon")
end
