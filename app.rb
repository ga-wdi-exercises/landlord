require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'

require 'pry' # for debugging

# connect to db
require_relative 'db/connection'

# load models
require_relative 'models/apartments'
require_relative 'models/tenants'
