require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
Apartment.create(:address =>"254 Julie Rd", :monthly_rent => 1200, :sqft => 1000, :num_beds => 1, :num_baths => 1)
Apartment.create(:address =>"987 Jefferson St", :monthly_rent => 2100, :sqft => 1800, :num_beds => 3, :num_baths => 3)
Apartment.create(:address =>"369 Pheffercorn Ave", :monthly_rent => 1500, :sqft => 1200, :num_beds => 1, :num_baths => 2)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Tenant.create(:name =>"Timothy Little", :age => 54, :gender => "male", :apartment_id => 15)
Tenant.create(:name =>"Jim Beam", :age => 65, :gender => "male", :apartment_id => 8)
Tenant.create(:name =>"Howard Stern", :age => 24, :gender => "male", :apartment_id => 6)
Tenant.create(:name =>"Janice Kilborn", :age => 31, :gender => "female", :apartment_id => 4)
Tenant.create(:name =>"Gregory Peck", :age => 62, :gender => "male", :apartment_id => 11)
Tenant.create(:name =>"Mark Young", :age => 73, :gender => "male", :apartment_id => 12)
Tenant.create(:name =>"James Howard", :age => 65, :gender => "male", :apartment_id => 9)
Tenant.create(:name =>"Larry Stewart", :age => 89, :gender => "male", :apartment_id => 8)
