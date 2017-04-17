require "bundler/setup"
require "pg"
require "active_record"
require "pry"


require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "ar_exercise/exercise.rb"

binding.pry

puts "end of file"
