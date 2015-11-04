require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb:":apartments"
end

get '/apartments' do
  erb:"apartments/1"
end

get '/apartments/new' do
  erb:"apartments/new"
end

get '/apartments/1/tenants' do
  erb:"apartments/1/tenants"
end
