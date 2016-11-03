require 'sinatra'
require 'sinatra/reloader'
require 'bundler/setup'
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging



##index
get '/apartments' do
  @apartments = Apartment.all
  erb :'apartments/index'
end
