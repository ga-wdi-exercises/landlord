require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"

require_relative "models/tenant"
require_relative 'models/apartment'

get '/' do
  redirect '/tenants'
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/new' do
  erb :"tenants/new"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end

post '/tenants' do
  @tenant = Tenant.create(params[:tenant])
  redirect "/tenants/#{@tenant.id}"
end
