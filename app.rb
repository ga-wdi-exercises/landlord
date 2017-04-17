require "sinatra"
require "sinatra/reloader"
require "active_record"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# got stuck, peeked at solutions, realized should move anchor tags to a separate layout.erb file, and that I needed to require_relative all those files

get'/' do
	erb :index
end

get '/apartments' do
	@apartments = Apartment.all
	erb :apartments
end

get '/apartments/new' do
	erb :apartments_new
end

get '/apartments/:id' do
	@apartment = Apartment.find(params[:id])
	erb :apartments_num
end

post '/apartments' do
	@apartment = Apartment.create(address: params[:address], monthly_rent: params[:monthly_rent], sqft: params[:sqft], num_beds: params[:num_beds], num_baths: params[:num_baths])
	redirect "/apartments/#{apartment.id}"
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :edit
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect("/apartments/#{@apartment.id}")
end