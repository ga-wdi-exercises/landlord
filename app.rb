require "bundler/setup"
require "pg"
require "active_record"
require "sinatra"
require "sinatra/reloader"
require "pry"
require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "controllers/apartments_controller"
require_relative "controllers/tenants_controller"



get "/" do
  erb :home
end
