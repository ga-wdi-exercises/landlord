require "bundler/setup"
require "pg" 
require "active_record"
require "pry" 

require_relative "connection" 
require_relative "../models/apartment" 
require_relative "../models/tenant"