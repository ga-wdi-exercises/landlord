require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

require_relative 'db/connection'
require_relative 'models/tenant'
require_relative 'models/apartment'

get '/' do
  erb :"home"
end

get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end

get '/tenants/new' do
 erb :"tenants/new"
end

get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end


post '/tenants' do
  @tenant = Tenant.create(params[:tenant])
  redirect ("/tenants/#{@tenant.id}")
end


get '/tenants/:id/edit' do
  @tenant  = Tenant.find(params[:id])
  erb :"tenants/edit"
end


put "/tenants/:id" do
  @tenant = Tenant.find(params[:id])
  @tenant.update(params[:tenant])
  redirect ("/tenants/#{@tenant.id}")
end

delete "/tenant/:id" do
@tenant = Tenant.find(params[:id])
@tenant.destroy

redirect ("/tenants")
end








get "/apartments" do
  @apartments = Apartment.all

  erb :"apartments/index"
end

get "/apartments/new" do
  erb :"apartments/new"
end

get "/apartments/:id" do
@apartment = Apartment.find(params[:id])
 erb :"apartments/show"
end



post "/apartments" do
 @apartment = Apartment.create(params[:trainer])
  redirect ("/apartments/#{@trainer.id}")
end

get "/apartments/:id/edit" do
 @apartment = Apartment.find(params[:id])
  erb :"/apartments/edit"
end

put "/apartments/:id" do
 @apartment = Apartment.find(params[:id])
 @apartment.update(params[:trainer])
  redirect ("/apartments/#{@trainer.id}")
end

delete "/apartments/:id" do
 @apartment = Apartment.find(params[:id])
 @apartment.destroy
  redirect ("/apartments")
end
