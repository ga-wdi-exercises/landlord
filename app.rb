require 'bundler/setup'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  erb :index
  @apartments = Apartment.all
  @tenants = Tenant.all
end
