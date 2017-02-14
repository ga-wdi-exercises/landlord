require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/:id' do
  @apartments = Apartment.first
  erb :"apartments/index"
end

get 'apartments/:id/tenants' do
  erb :"tenants/index"
end

get '/apartmens/new' do
  @apartments = Apartment.create
  erb :"apartments/index"
end

get 'apartments/:id/tenants/new' do
  erb :"tenants/new"
end
