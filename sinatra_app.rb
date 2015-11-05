require "bundler/setup"
require 'pry'
require 'active_record'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

apt_id = 0

get "/" do
  erb :index
end
get "/apartments" do
  @apt_id = apt_id
  @apt_id = params[:apt]
  erb :"apartments/index"
end
get "/apartments/new" do
  erb :"apartments/new"
end
get "/apartments/:id" do
  puts "*"*20
  @apt_id = params[:id]
  puts @apt_id
  erb :"apartments/show"
end
get "/apartments/:id/tenants" do
  erb :"tenants/index"
end
get "/apartments/:id/tenants/new" do
  erb :"tenants/new"
end
