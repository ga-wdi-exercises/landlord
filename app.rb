require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
require_relative 'controllers/apartments_controller'

get '/' do
  erb :home
end

# names = []
#
# get "/" do
#   @names= names
#   erb :index
#   # erb :index ALWAYS goes at the end!
# end
#
# post "/" do
#   @names = names
#   @names.push(params[:name])
#   erb :index
# end
#
# put "/" do
#   "you just PUT"
# end
#
# patch "/" do
#   "you just PATCHED"
# end
#
# delete "/" do
#   "you DELETED!"
# end
