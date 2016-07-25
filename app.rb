require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  redirect '/apartments'
end

get '/apartments' do
  @all_apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  "hello there"
end
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end
