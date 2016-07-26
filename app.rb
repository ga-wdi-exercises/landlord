require 'sinatra'
require 'sinatra/reloader'
require "pg"
require "active_record"

require_relative "db/connection"

require_relative "models/tenant"
require_relative 'models/apartment'


get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end
