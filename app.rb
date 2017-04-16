
require "pg"
require "active_record"
require "pry"
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

all_apartments = ['70335 Clemenargaertine Tunnel', '44010 Lemke Crossroad', '77841 Jany Lane', '4518 Ivy Spur', '95287 Kamille Underpass', '95599 Koch Stream', '62897 Verna Walk', '3710 Buford Passage''0889 Marvin Radial', '2745 Freddy Vista', '08465 Howell Harbor']
details = ['Monthly rent: 800', 'Sqf: 1900', 'Number of beds: 3', 'Number of baths: 2']
tenants = ['Maudie Mosciski', 'Kristin Wisoky']

get "/" do
  erb :index
end

get "/apartments" do
  @apts = all_apartments
  erb :index1
end

get "/apartments/1" do
  @dets = details
  erb :index2
end

get "/apartments/1/tenants" do
  @tens = tenants
  erb :index3
end
