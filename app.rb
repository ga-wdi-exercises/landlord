require 'sinatra'
require 'sinatra/reloader'
require "pg" # postgres db library
require "active_record" # the ORM
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/' do
  redirect '/apartments'
end

# List out all apts
get '/apartments' do
  @apartments=Apartment.all
  erb :"apartments/index"
end

# get '/apartments' do
#   @apartments = Apartment.all
#   erb :"apartments/index"
# end


get '/apartments/new' do
  erb :"apartments/new"
end

# Apartment show page
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

# Create a new apartment
post '/apartments' do
  @apartment = Apartment.create(name: params[:name], poke_type: params[:poke_type], cp: params[:cp], img_url: params[:img_url])
end

# Edit apartment
get '/apartments/:id/edit' do
  @apartment=Apartment.find(params[:id])
  erb :"apartments/edit"
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments #{apartment.id}"
end

delete '/apartment/:id' do
  apartment = Apartment.find(params[:id])
  apartment.destroy
  redirect "/apartments"
end

# binding.pry
# puts "end"
