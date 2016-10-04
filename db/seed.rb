require "bundler/setup"
require "pg"
require "active_record"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all


Apartment.create(:address =>"123 crofton Rd", :monthly_rent => 1200, :sqft => 1200, :num_beds => 4, :num_baths => 1)
Apartment.create(:address =>"456 crumpton St", :monthly_rent => 1200, :sqft => 1200, :num_beds => 5, :num_baths => 1)
Apartment.create(:address =>"789 clinton Ave", :monthly_rent => 1200, :sqft => 1200, :num_beds => 3, :num_baths => 1)


Tenant.create(:name =>"Robin Hood", :age => 54, :gender => "male", :apartment_id => 1)
Tenant.create(:name =>"Little John", :age => 65, :gender => "male", :apartment_id => 2)
Tenant.create(:name =>"Ali Baba", :age => 24, :gender => "male", :apartment_id => 6)
Tenant.create(:name =>"Aladin", :age => 31, :gender => "male", :apartment_id => 4)
Tenant.create(:name =>"Lion King", :age => 22, :gender => "male", :apartment_id => 11)
Tenant.create(:name =>"Bruce Lee", :age => 73, :gender => "male", :apartment_id => 3)
Tenant.create(:name =>"Jackie Chain", :age => 65, :gender => "male", :apartment_id => 9)
Tenant.create(:name =>"Chuck Norris", :age => 89, :gender => "male", :apartment_id => 7)
Tenant.create(:name =>"Snow White", :age => 99, :gender => "femmale", :apartment_id => 8)
