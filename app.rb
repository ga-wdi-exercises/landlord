require 'sinatra'
require 'sinatra/reloader'

get '/' do
  return 'Hello world!'
end

GET/apartments

get '/apartments' do
  @apartment = apartments.find {|apartment| id == params[:id]}
  erb :id
end

apartment1 = Apartment.create(address: '1601 Argonne Pl NW', monthly_rent: 1925, sqft: 750, num_beds: 1, num_baths: 1)
apartment2 = Apartment.create(address: '1523 22nd St NW', monthly_rent: 2200, sqft: 1000, num_beds: 3, num_baths: 2)
apartment3 = Apartment.create(address: '530 Overbrook Rd', monthly_rent: 1500, sqft: 1200, num_beds: 2, num_baths: 2)
