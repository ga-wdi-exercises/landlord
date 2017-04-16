# require "pg" # postgres db library
# require "active_record" # the ORM
# require "pry" # for debugging
require 'sinatra'
require 'sinatra/reloader'

# ActiveRecord::Base.establish_connection(
#   :adapter => "postgresql",
#   :database => "landlord"
# )
#
# class Tenant < ActiveRecord::Base
#   belongs_to :apartment
# end
#
# class Apartment < ActiveRecord::Base
#   has_many :tenants
# end


apartments_list = [{address: "place0", id: 1},
              {address: "place1", id: 2},
              {address: "place2", id: 3},
              {address: "place3", id: 4},
              {address: "place4", id: 5}]


get '/' do
    erb :index
end

get '/apartments' do
    @apartments = apartments_list
    erb :apartments
end

get '/apartments/:num' do
    @apartment_id = params[:id].to_i
    erb :index
end

get '/apartments/new' do

    erb :index
end

get '/apartments/1/tenants' do

    erb :index
end
