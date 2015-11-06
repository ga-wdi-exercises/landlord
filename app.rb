require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection.rb" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/apartment"
require_relative "models/tenant"

get '/' do
 erb :index
end

get '/apartments' do
  @apartments = Apartment.all
  @tenants = Tenant.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

get '/apartments/:id' do
  @apartments = Apartment.all
  @tenants = Tenant.all
  @id = params[:id].to_i
  erb :"apartments/show"
end

post '/apartments' do
  @id = params[:id]
  redirect "/apartments"
end

get '/apartments/:id/tenants' do
 erb :"tenants/show"
end

get '/apartments/:id/tenants/new' do
  erb :"tenants/new"
end

post '/apartments' do
  Apartment.create(address: params[:apartment_address], monthly_rent: params[:apartment_monthly_rent].to_i, sqft: params[:sqft].to_i, num_beds: params[:apartment_num_beds].to_i, num_baths: params[:apartment_num_baths].to_i)
  redirect '/apartments'
end
