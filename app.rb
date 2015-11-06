require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require "sinatra"
# require "sinatra-contrib"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/' do
  erb :"index"
end

get '/apartment' do
  erb :"apartments/index"
end

get '/apartment/new' do
  erb :"apartments/new"
end

get '/apartment/:id' do
  erb :"apartment/show"
end

get '/apartment/:id/tenant' do
  erb :"tenant/index"
end

get '/apartment/:id/tenant/new' do
  erb :"tenant/new"
end







# binding.pry
# "YOU NEVER KNOW"
