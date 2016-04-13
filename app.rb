require "bundler/setup"
require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/apartment"
require_relative "models/tenant"


binding.pry

puts "end of application"
