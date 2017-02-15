require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all

# Create 3 new apartments, and save them to the DB
Apartment.create({ :address => "Chamber of Sages", :monthly_rent => 1, :sqft => 400, :num_beds => 6, :num_baths => 0 })
Apartment.create({ :address => "5 Treehouse Lane", :monthly_rent => 500, :sqft => 5000, :num_beds => 1, :num_baths => 1})
Apartment.create({ :address => "Hyrule Castle", :monthly_rent => 60000, :sqft => 50000, :num_beds => 100, :num_baths => 99})

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create({ :name => "Link", :age => 18, :gender => "Male", :apartment_id => 2})
Tenant.create({ :name => "Princess Zelda", :age => "18", :gender => "Female", :apartment_id => 3})
Tenant.create({ :name => "Ganondorf", :age => 35, :gender => "Male", :apartment_id => 3})
Tenant.create({ :name => "Navi", :age => 1, :gender => "Female", :apartment_id => 2})
Tenant.create({ :name => "Rauru", :age => 1000, :gender => "Male", :apartment_id => 1})
Tenant.create({ :name => "Saria", :age => 8, :gender => "Female", :apartment_id => 1})
Tenant.create({ :name => "Darunia", :age => 37, :gender => "Male", :apartment_id => 1})
Tenant.create({ :name => "Princess Ruto", :age => 18, :gender => "Female", :apartment_id => 1})
Tenant.create({ :name => "Impa", :age => 46, :gender => "Female", :apartment_id => 1})
Tenant.create({ :name => "Nabooru", :age => 29, :gender => "Female", :apartment_id => 1})
