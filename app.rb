require "bundler/setup"
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require "pg"

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/tenant'
require_relative 'models/apartment'




binding.pry
