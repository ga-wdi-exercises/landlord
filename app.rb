require 'bundler/setup'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# add models, delete this when added
