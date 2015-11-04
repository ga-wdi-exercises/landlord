require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "db/connection"
require_relative "models/tenant"
require_relative "models/apartment"

binding.pry