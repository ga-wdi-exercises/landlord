require "bundler/setup"
require 'sinatra'
require "sinatra/reloader" #it reloads so there's no turning server off.. reloads server.

require "pg"
require "active_record"
require "pry"
require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative 'config/db.rb'
