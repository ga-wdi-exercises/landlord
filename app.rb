require "pry"
require "sinatra"
require "sinatra/reloader"
require "active_record"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get "/" do
  redirect to ("/apartments")
end

get "/apartments" do
  erb :index
end

get "/apartments/new" do
  erb :new
end

get "/apartments/:id" do
  erb :show
end

get "/apartments/:id/edit" do
  erb :edit
end
