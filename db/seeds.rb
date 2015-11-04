require "bundler/setup"
require "pry"
require "pg"
require "active_record"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

binding.pry
