require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

#home page
get '/' do
  erb :home
end

#aparment list
get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

#new apartment
get '/apartments/new' do
  @apartments = Apartment.all
  erb :"apartments/new"
end

#post apartment
post '/apartments' do
  @apartments = Apartment.create!(params[:apartments])
  redirect "/apartments/#{@apartments.id}"
end

#apartment show page
get '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  erb :"/apartments/show"
end

#edit apartment
get '/apartments/:id/edit' do
  @apartments = Apartment.find(params[:id])
  erb :"apartments/edit"
end

#post edited apartment
put '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  @apartments.update(params[:apartments])
  redirect "/apartments/#{@apartments.id}"
end

delete '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  @apartments.destroy
  redirect '/apartments'
end

# binding.pry
# puts "end of file"
