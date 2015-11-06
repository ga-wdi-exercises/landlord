require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"
require_relative 'apartments_controller'
require_relative "models/tenant"
require_relative "models/apartment"


get '/' do
  erb :home
end

# - The homepage should list several menu options:
#   * List all apartments (a link to `GET /apartments`)


#   * View an apartment's details(a link to `GET /apartments/1`)

#   * Add an apartment(a link to `GET /apartments/new`)
