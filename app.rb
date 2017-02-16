require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'

require_relative 'models/apartment'
require_relative 'models/tenant'

get '/' do
  erb :"home"
end

get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get '/apartments/new' do
  erb :"apartments/new"
end

post '/apartments' do
  @apartment = Apartment.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_baths])
  redirect "apartments/#{@apartment.id}"
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb(:"apartments/edit")
end

get '/apartments/:id/tenants/new' do
  @apartment = Apartment.find(params[:id])
  erb :"tenants/new"
end

post '/apartments/:id/tenants' do
  @apartment = Apartment.find(params[:id])
  @tenant = Tenant.create(name: params[:name], age: params[:age], gender: params[:gender], apartment_id: @apartment[:id])
  redirect "/apartments/#{@apartment.id}/tenants/#{@tenant.id}"
end

get '/apartments/:id/tenants' do
  @apartment = Apartment.find(params[:id])
  @tenants = Tenant.select{|tenant| tenant[:apartment_id] == @apartment[:id]}
  erb :"/apartments/tenants"
end

get '/apartments/:id/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect("/apartments/#{@apartment.id}")
end

delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect("/apartments")
end
