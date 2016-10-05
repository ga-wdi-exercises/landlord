require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pg'
require 'pry'
require 'bundler/setup'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/' do
  redirect '/apartments'
end

get '/apartments' do
  @apartments = Apartment.all
  erb :index
end
