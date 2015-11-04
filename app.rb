require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/apartments' do
  erb :apartments
end

get '/apartments/1' do
  erb :apt1
end

get '/apartments/new' do
  erb :new_apt
end

get '/apartments/1/tenants' do
  erb :apt1tenants
end

get 'apartments/1/tenants/new' do
  erb :new_tenant
end
