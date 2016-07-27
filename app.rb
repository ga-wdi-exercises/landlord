require "bundler/setup"
require "pg"
require "active_record"
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
