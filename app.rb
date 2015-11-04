require 'sinatra'
require 'sinatra/reloader'

# Home
get "/" do
  erb :"index"
end

# Show all apartments
get "/apartments" do
  erb :"apartments/index"
end

# Add apartment
get "/apartments/new" do
  erb :"apartments/new"
end

# Show apartment details by id
get "/apartments/:apt_id" do
  erb :"apartments/show"
end

# Show all tenants in apartment (by apt_id)
get "/apartments/:apt_id/tenants" do
  erb :"tenants/index"
end

# Show all tenants in apartment (by apt_id)
get "/apartments/:apt_id/tenants/new" do
  erb :"tenants/new"
end
