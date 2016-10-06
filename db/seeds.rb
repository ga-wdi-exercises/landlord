require 'pry'
require 'rb-readline'
require 'sinatra'

require_relative "connection"
require_relative "models/apartment"
require_relative "models/tenant"

Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
one = Apartment.create(:address => '1234 River Street', :monthly_rent => 1200, :sqft => 2300, :num_beds => 4, :num_baths =>1)
two = Apartment.create(:address => '892 Happy Feet Street', :monthly_rent => 1700, :sqft => 2100, :num_beds => 5, :num_baths => 2)
three = Apartment.create(:address => '900 Elizabeth Ave', :monthly_rent => 9000, :sqft => 4100, :num_beds => 6, :num_baths => 4)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
t_one = Tenant.create(:name => "Latoya Watson", :age => 21, :gender => "Female", :apartment_id => 20)
t_two = Tenant.create(:name => "Sarah South", :age => 43, :gender => "Female", :apartment_id => 4)
t_three = Tenant.create(:name => "North West", :age => 61, :gender => "Female", :apartment_id => 20)
t_four = Tenant.create(:name => "Beckey Yuah", :age => 45, :gender => "Female", :apartment_id => 22)
t_five = Tenant.create(:name => "Lauren Burrell", :age => 32, :gender => "Female", :apartment_id => 9)
t_six = Tenant.create(:name => "Mary Watson", :age => 63, :gender => "Male", :apartment_id => 20)
t_seven = Tenant.create(:name => "Jamie Smith", :age => 55, :gender => "Male", :apartment_id => 21)
t_eight = Tenant.create(:name => "Rob Smith", :age => 34, :gender => "Male", :apartment_id => 21)
t_nine = Tenant.create(:name => "Kim K", :age => 54, :gender => "Female", :apartment_id => 8)
