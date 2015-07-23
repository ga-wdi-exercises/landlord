require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'

# Load specific routes
require_relative 'controllers/welcome'
require_relative 'controllers/apartments'
require_relative 'controllers/tenants'
