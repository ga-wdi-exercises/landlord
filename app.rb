require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

get '/' do
  erb :"index"
end

get '/apartments/' do
  @apartments = Apartment.all
  erb :"index"
end

get '/apartments/new' do
  erb :"new_apt"
end

post '/apartments/' do
  Apartment.create(address: params[:address], sqft: params[:sqft],
  monthly_rent: params[:monthly_rent], num_beds: params[:num_beds],
  num_baths: params[:num_baths])
  redirect '/apartments/'
end

get '/apartments/:address/tenants/new' do
  @apt = Apartment.find_by(address: params[:address])
  @id = @apt.id
  erb :"new_tenant"
end

get '/apartments/:address/tenants' do
  @apt = Apartment.find_by(address: params[:address])
  @id = @apt.id
  @tenants = []
  Tenant.where(apartment_id: @id).find_each do |tnt|
      @tenants.push(tnt.name)
    end
  @tenants = @tenants.join(", ")
  erb :"tenants"
end

before do
  @url = request.path_info.slice! "/new"
end

post '#{@url}' do
  'Hello, world'
  redirect '#{@url}'
end

get '/apartments/:address' do
  @apt = Apartment.find_by(address: params[:address])
  @id = @apt.id
  erb :"apartment_details"
end
