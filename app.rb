require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get "/" do
  erb :index
end

get "/apartments" do
  erb :apartments
end
