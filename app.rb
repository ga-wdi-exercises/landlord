require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "controllers/apartment_controller.rb"

# binding.pry

get '/' do
  erb :home
end
