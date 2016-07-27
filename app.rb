require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"

require_relative "models/tenant"
require_relative 'models/apartment'


# get '/tenants' do
#   @tenants = Tenant.all
#   erb :"tenants/index"
# end

binding.pry

puts "end of application"
