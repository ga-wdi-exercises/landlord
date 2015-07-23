require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'

require 'pry' # for debugging

# connect to db
require_relative 'db/connection'

# load models
require_relative 'models/apartment'
require_relative 'models/tenant'

# Load specific routes
require_relative 'controllers/welcome'
require_relative 'controllers/apartments'
require_relative 'controllers/tenants'
