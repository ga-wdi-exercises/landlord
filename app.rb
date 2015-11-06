require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartments"
require_relative "models/tenants"
require_relative 'controllers/apartments_controller.rb'

get '/' do
  erb :home
end

# get "/" do
#   puts "*" * 50
#   erb :index
# end
#
# get "/apartments" do
#   "*" * 100
#   erb :apartments
# end
#
# get "/tenants" do
#   erb :tenants
# end

#
# binding.pry
