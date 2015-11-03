require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/apartments"
require_relative "models/tenants"
require_relative "db/seeds.rb"


binding.pry
