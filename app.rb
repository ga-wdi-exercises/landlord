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
  @apartments = Apartment.all
  erb :"apartments/index"
end

# Generates a new view w a form which contains
# ability to create an apt
# This must be before :id path
get '/apartments/new' do
  erb :"apartments/new"
end

# Apartment show page w a button to edit the apartment
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

# Create a new apartment, this path needs to be the same as the action of the form that's making the request in the new.erb
post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

# Edit apartment
get '/apartments/:id/edit' do
  @apartment=Apartment.find(params[:id])
  erb :"apartments/edit"
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect "/apartments"
end

# binding.pry
# puts "end"
