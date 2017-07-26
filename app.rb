require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'

require_relative 'models/apartment'
require_relative 'models/tenant'


get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end
# get 'apartments/new' do
#
# end
#
# get 'apartments/:id' do
#
# end
#
# get 'apartments/:id/:tenants' do
#
# end
