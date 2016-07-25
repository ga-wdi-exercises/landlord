require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# load the fild to connect to the db
require_relative 'db/connection'

# load models
require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  redirect '/apartments'
end

get '/apartments' do
@apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  erb :"apartments/show"
end
