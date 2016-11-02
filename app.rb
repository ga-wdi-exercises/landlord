require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require_relative 'db/connection'

require_relative 'models/apartment'
require_relative 'models/tenant'


get '/apartments' do
  @apartments = Apartment.all
  erb :"index"
end

get '/apartments/:id' do

end

get '/apartments/new' do

end

get '/apartments/:id/tenants' do

end

get '/apartments/:id/tenants/new' do

end
