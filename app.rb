require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

apartments=[{id: 1, address: "70335 Clemenargaertine Tunnel", monthly_rent: 800, sqft: 1900, num_beds: 3, num_baths: 2},
 {id: 2, address: "44010 Lemke Crossroad", monthly_rent: 1000, sqft: 1300, num_beds: 1, num_baths: 3},
 {id: 3, address: "77841 Jany Lane", monthly_rent: 700, sqft: 2300, num_beds: 4, num_baths: 3},
 {id: 4, address: "4518 Ivy Spur", monthly_rent: 2000, sqft: 1000, num_beds: 1, num_baths: 2},
 {id: 5, address: "95287 Kamille Underpass", monthly_rent: 2800, sqft: 1400, num_beds: 1, num_baths: 3},
 {id: 6, address: "6005 Damien Corners", monthly_rent: 400, sqft: 2300, num_beds: 4, num_baths: 1},
 {id: 7, address: "95599 Koch Stream", monthly_rent: 2400, sqft: 1900, num_beds: 2, num_baths: 4},
 {id: 8, address: "40583 Hal Crossing", monthly_rent: 200, sqft: 800, num_beds: 3, num_baths: 2},
 {id: 9, address: "62897 Verna Walk", monthly_rent: 2400, sqft: 700, num_beds: 2, num_baths: 3},
 {id: 10, address: "351 Dibbert Fields", monthly_rent: 2300, sqft: 1300, num_beds: 2, num_baths: 1},
 {id: 11, address: "3710 Buford Passage", monthly_rent: 500, sqft: 700, num_beds: 1, num_baths: 4},
 {id: 12, address: "64329 Tyree Creek", monthly_rent: 500, sqft: 2000, num_beds: 1, num_baths: 3},
 {id: 13, address: "17297 Runte Bypass", monthly_rent: 2300, sqft: 1700, num_beds: 3, num_baths: 2},
 {id: 14, address: "0889 Marvin Radial", monthly_rent: 1100, sqft: 500, num_beds: 3, num_baths: 2},
 {id: 15, address: "2745 Freddy Vista", monthly_rent: 2800, sqft: 1400, num_beds: 4, num_baths: 4},
 {id: 16, address: "359 Gutmann Pike", monthly_rent: 2700, sqft: 1900, num_beds: 2, num_baths: 1},
 {id: 17, address: "08465 Howell Harbor", monthly_rent: 300, sqft: 1300, num_beds: 3, num_baths: 1},
 {id: 18, address: "8865 Borer Viaduct", monthly_rent: 600, sqft: 600, num_beds: 1, num_baths: 4},
 {id: 19, address: "7357 Emard Row", monthly_rent: 2600, sqft: 2300, num_beds: 3, num_baths: 2}]

get '/' do
  'mia is awesome!'
end

get '/apartments' do
  @apartments=apartments
  erb :apartments
end

get '/apartments/new' do
  erb :new_apartment
end

get '/apartments/:id' do
  @id=params[:id].to_i-1
  @apartments=apartments
  erb :apartment_id
end
