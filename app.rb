require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartments"
require_relative "models/tenants"
require_relative "controllers/apartments"
require_relative "controllers/tenants"

get "/" do
  erb :index
end
