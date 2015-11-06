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

tenants=[{id: 1, name: "Maudie Mosciski", age: 90, gender: "Female", apartment_id: 1},
  {id: 2, name: "Kristin Wisoky", age: 23, gender: "Female", apartment_id: 1},
  {id: 3, name: "Demario King", age: 71, gender: "Female", apartment_id: 2},
  {id: 4, name: "Kaitlin Cormier", age: 91, gender: "Male", apartment_id: 3},
  {id: 5, name: "Rosalinda Champlin", age: 39, gender: "Male", apartment_id: 3},
  {id: 6, name: "Valentin Keebler Sr.", age: 74, gender: "Male", apartment_id: 5},
  {id: 7, name: "Ms. Garland Beatty", age: 60, gender: "Female", apartment_id: 6},
  {id: 8, name: "Eryn Lynch", age: 12, gender: "Male", apartment_id: 6},
  {id: 9, name: "Tiara Conn", age: 3, gender: "Male", apartment_id: 7},
  {id: 10, name: "Tillman Schroeder", age: 27, gender: "Male", apartment_id: 7},
  {id: 11, name: "Amber Jewess", age: 57, gender: "Female", apartment_id: 7},
  {id: 12, name: "America Pollich", age: 82, gender: "Female", apartment_id: 7},
  {id: 13, name: "Mylene Krajcik", age: 25, gender: "Male", apartment_id: 7},
  {id: 14, name: "Josh Gottlieb", age: 8, gender: "Female", apartment_id: 8},
  {id: 15, name: "Sherwood Stiedemann", age: 72, gender: "Female", apartment_id: 8},
  {id: 16, name: "Katarina Kunde", age: 6, gender: "Female", apartment_id: 8},
  {id: 17, name: "Mabelle Eichmann", age: 16, gender: "Male", apartment_id: 9},
  {id: 18, name: "Mason Blanda", age: 83, gender: "Female", apartment_id: 9},
  {id: 19, name: "Sonny Dibbert I", age: 30, gender: "Female", apartment_id: 9},
  {id: 20, name: "Gus Herman II", age: 65, gender: "Male", apartment_id: 9},
  {id: 21, name: "Delia Christiansen MD", age: 57, gender: "Female", apartment_id: 9},
  {id: 22, name: "Willow Ledner Jr.", age: 46, gender: "Male", apartment_id: 9},
  {id: 23, name: "Titus Harvey", age: 19, gender: "Male", apartment_id: 10},
  {id: 24, name: "Ms. Randal Konopelski", age: 7, gender: "Female", apartment_id: 10},
  {id: 25, name: "Caleb Maggio", age: 55, gender: "Male", apartment_id: 11},
  {id: 26, name: "Hilbert Effertz", age: 30, gender: "Male", apartment_id: 11},
  {id: 27, name: "Bartholome Herman", age: 93, gender: "Male", apartment_id: 11},
  {id: 28, name: "Merritt Durgan", age: 34, gender: "Female", apartment_id: 11},
  {id: 29, name: "Helmer Grimes", age: 80, gender: "Female", apartment_id: 14},
  {id: 30, name: "Derrick Farrell", age: 81, gender: "Male", apartment_id: 14},
  {id: 31, name: "Enola Sauer V", age: 31, gender: "Female", apartment_id: 14},
  {id: 32, name: "Jimmy Bartell", age: 22, gender: "Female", apartment_id: 14},
  {id: 33, name: "Christophe Boyle DVM", age: 55, gender: "Female", apartment_id: 15},
  {id: 34, name: "Miss Wanda Kris", age: 57, gender: "Female", apartment_id: 15},
  {id: 35, name: "Miss Maeve Goldner", age: 10, gender: "Male", apartment_id: 15},
  {id: 36, name: "Noemie Daniel", age: 15, gender: "Female", apartment_id: 15},
  {id: 37, name: "Shanna Jacobson", age: 38, gender: "Female", apartment_id: 15},
  {id: 38, name: "Javier Boehm", age: 82, gender: "Female", apartment_id: 15},
  {id: 39, name: "Aurelia Harvey", age: 35, gender: "Male", apartment_id: 16},
  {id: 40, name: "Dangelo Bogisich", age: 60, gender: "Female", apartment_id: 16},
  {id: 41, name: "Benton Abernathy", age: 55, gender: "Female", apartment_id: 16},
  {id: 42, name: "Marina Kemmer", age: 37, gender: "Female", apartment_id: 16},
  {id: 43, name: "Dasia Vandervort", age: 4, gender: "Female", apartment_id: 16},
  {id: 44, name: "Bo Medhurst", age: 6, gender: "Male", apartment_id: 17},
  {id: 45, name: "Elta Fay", age: 6, gender: "Female", apartment_id: 18},
  {id: 46, name: "Conner Dare", age: 92, gender: "Male", apartment_id: 18},
  {id: 47, name: "Dr. Lindsey Reichert", age: 18, gender: "Male", apartment_id: 18},
  {id: 48, name: "Carlee Nolan", age: 77, gender: "Female", apartment_id: 18},
  {id: 49, name: "Bernie Weimann", age: 11, gender: "Male", apartment_id: 18},
  {id: 50, name: "Jose Denesik", age: 26, gender: "Female", apartment_id: 18},
  {id: 51, name: "Guadalupe OHara", age: 9, gender: "Female", apartment_id: 20},
  {id: 52, name: "Sheridan Jacobson Sr.", age: 6, gender: "Female", apartment_id: 20},
  {id: 53, name: "Bennett Jakubowski", age: 69, gender: "Female", apartment_id: 20},
  {id: 54, name: "Annette Stamm", age: 76, gender: "Male", apartment_id: 20},
  {id: 55, name: "Dr. Raquel Carter", age: 61, gender: "Female", apartment_id: 20},
  {id: 56, name: "Grover Rath", age: 9, gender: "Female", apartment_id: 20}]


get '/' do
  erb :home
end

get '/apartments' do
  @apartments=apartments
  erb :index
end

get '/tenants' do
  @tenants=tenants
  erb :index
end

get '/apartments/new' do
  erb :new
end

get '/apartments/:id' do
  @id=params[:id].to_i-1
  @apartments=apartments
  erb :id
end

get '/apartments/:id/tenants' do
  @id=params[:id].to_i-1
  @apartments=apartments
  @tenants=tenants
  erb :id_tenants
end

get '/apartments/:id/tenants/new' do
  erb :id_tenants_new
end
