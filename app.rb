



require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging
require "sinatra"
require "sinatra/reloader"
ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)

class Tenant < ActiveRecord::Base
  belongs_to :apartment
end

class Apartment < ActiveRecord::Base
  has_many :tenants
end

# CLI Commands
# puts "OPTIONS"
# puts "Type '1' to view all the apartments"
# puts "Type '2' to view all the tenants"
# puts "Type '3' to view list of all apartments and their associated tenants"
#
# user_input = gets.chomp
# if user_input == "1"
#   # apartment.each do |apt|
#   #   puts apt
#   # end
#   puts Apartment.all
# elsif user_input == "2"
#   # tenant.each do |tenant|
#   #   puts tenant
#   puts Tenant.all
#
# elsif user_input == "3"
#   Apartment.all.each do |apartment|
#                  house_tenants = Tenant.select{|tenant| tenant[:apartment_id] == apartment[:id]}
#                  puts apartment.address
#                  puts house_tenants
#               end
#
# end


# binding.pry

get '/' do
  erb :index
end

get '/apartments' do
  erb :"apartments/index"
end
