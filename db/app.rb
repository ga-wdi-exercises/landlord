require 'sinatra'
require 'sinatra/reloader'
require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

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
