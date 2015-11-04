require "bundler/setup"
require 'pry'
require 'active_record'
require 'pg'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

binding.pry
