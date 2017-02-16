require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection.rb'
require_relative 'controllers/apartments.rb'
require_relative 'controllers/tenants.rb'
require_relative 'models/apartment'
require_relative 'models/tenant'

get "/" do
  erb :home
end
