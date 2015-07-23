require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :"index"
end

get '/apartments' do
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

get '/apartments/:id' do
  erb :"apartments/show"
end

get '/apartments/:id/tenants' do
  erb :"tenants/index"
end

get '/apartments/:id/tenants/new' do
  erb :"tenants/new"
end
