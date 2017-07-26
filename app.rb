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

#apartment show page
get '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  erb :"/apartments/show"
end

# binding.pry
# puts "end of file"
