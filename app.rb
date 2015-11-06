require "sinatra"
require "sinatra/reloader"
require "active_record"
require "pg"
require "pry"

get "/" do
  erb :index
end

require_relative "controllers/apartments"
require_relative "controllers/tenants"
require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
