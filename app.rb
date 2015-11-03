require "bundler/setup"
require "active_record"

require "pg"
require "pry"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

binding.pry
