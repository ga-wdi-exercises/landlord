require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"
require_relative "models/apartments"
require_relative "models/tenants"
require_relative "controller/apartments_controller.rb"
require_relative "controller/tenants_controller.rb"
# get '/' do
#   "hello world"
#   # erb :home
# end
