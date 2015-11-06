require "bundler/setup"
require "pg"
require "active_record"
require "pry"
require "sinatra"
require "sinatra/reloader"

require_relative "../db/connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

get "/tenants" do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get "/tenants/new" do
  erb :"tenants/new"
end

post "/tenants/new" do
  @name = params[:name]
  @age = params[:age].to_i
  @gender = params[:gender]
  new_tenant = Tenant.create(name: "#{@name}", age: @age, gender: "#{@gender}")
  redirect "/tenants"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end

get '/tenants/:id/edit' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/edit"
end

put '/tenants/:id/edit' do
  @tenant = Tenant.find(params[:id])
  @name = params[:name]
  @age = params[:age]
  @gender = params[:gender]
  @tenant.update(name: "#{@name}", age: "#{@age}", gender: "#{@gender}")
  erb :"tenants/show"
end
