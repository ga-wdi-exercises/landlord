require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/apartments' do
  erb :apartment_index
end

get '/apartments/new' do
  erb :apartment_new
end

get '/apartments/:id/tenants' do
  erb :tenants_index
end

get '/apartments/:id' do
  erb :apartment_detail
end

get '/tenants' do
  erb :tenant_index
end

get '/apartments/:id/tenants/new' do
  erb :tenant_new
end
