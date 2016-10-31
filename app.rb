require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/' do
  "<h1>Welcome to the Homepage!</h1>
  <p><a href='/apartments'> >>View All Apartments</a></p>
  <p><a href='/apartments/1'> >>View Apartment Details</a></p>
  <p><a href='/apartments/new'> >>Add an Apartment</a></p>
  <p><a href='/apartments/1/tenants'> >>View All Tenants</a></p>"

end

get '/apartments' do
  @apartments = Apartment.all
  erb :allApts
end

get '/apartments/new' do
  erb :addApt
end

get '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  erb :aptDetails
end

get '/apartments/:id/tenants' do
  @tenants = Apartment.find(params[:id])
  erb :tenants
end

post '/apartments' do
  Apartment.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds:params[:num_beds], num_baths: params[:num_baths])
  redirect "/apartments"
end
