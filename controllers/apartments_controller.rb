require 'pry'

get '/apartments' do
  @apartments_all = Apartment.all
  binding.pry
  erb :"apartments/index"
end

get '/apartments/:apartment_id' do
  "ur mom in this apartment"
end

get '/apartments/new' do
  "ur mom in a new place"
end

get '/apartments/:apartment_id/tenants' do
  "ur tenants do ur mom"
end
