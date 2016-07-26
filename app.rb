require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "sinatra"
require "sinatra/reloader"
require "pg" # postgres db library
require "active_record" # the ORM
require "faker"
require "pry" # for debugging

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# restful methods defined here(Get, Post, Put, Patch, Delete)
get '/' do
    @apartments=Apartment.all
    @tenants=Tenant.all
    erb :index
end

get '/apartments' do
    @apartments=Apartment.all
    @tenants=Tenant.all
    erb :"apartments/index"
end

get '/apartments/new' do
    erb :"apartments/new"
end

post '/apartments' do
    @apartments = Apartment.create(params[:apartment])
    redirect "/apartments/#{@apartments.id}"
end

get "/apartments/:id/edit" do
    @apartments=Apartment.find(params[:id])
    erb(:"apartments/edit")
end

put '/apartments/:id' do
    @apartments=Apartment.find(params[:id])
    @apartments.update(params[:apartment])
    redirect ("/apartments/#{@apartments.id}")
end

get '/apartments/:id' do
    @apartments=Apartment.find(params[:id])
    erb :"apartments/show"
end

delete '/apartments/:id' do
  @apartments=Apartment.find(params[:id])
  @apartments.destroy
  redirect("/apartments")
end

get '/apartments/:id/tenants' do
    @apartments=Apartment.find(params[:id])
    @tenants = Apartment.find(params[:id]).tenants
    erb :'apartments/tenants'
end

get '/apartments/:id/tenants/new' do
    @apartments=Apartment.find(params[:id])
    @tenants = Apartment.find(params[:id]).tenants
    erb :'apartments/tenants/new'
end

post '/tenants' do
    @tenants = Tenant.create(params[:tenant])
    redirect "/apartments/#{@tenants.apartment_id}/tenants"
end
