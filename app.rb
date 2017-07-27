require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative 'models/apartment'
require_relative 'models/tenant'
require_relative 'db/connection'


# get '/' do
#   @apartment = Apartment.all
#   erb :menu
# end

get '/' do
  @apartments = Apartment.all
  erb :menu
end

get '/apartments/new' do
  erb :new
end

get '/apartments/:id' do
  @apartment = Apartment.all.find(params[:id])
  erb :show
end

post '/' do
  @apartment = Apartment.create(
  params[:apartment]
  )
  redirect "/apartments/#{@apartment.id}"
end
