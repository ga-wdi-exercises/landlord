require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

new_apartments =
  {:address=>"5506 Englishman Place", :monthly_rent=> 1500, :sqft=> 1300, :num_beds=> 3, :num_baths=> 3},
  {:address=>"3504 Frederick Place", :monthly_rent=> 2200, :sqft=> 3100, :num_beds=> 4, :num_baths=> 3},
  {:address=>"5403 Nibud Ct", :monthly_rent=> 1000, :sqft=> 1200, :num_beds=> 3, :num_baths=> 2}

new_apartments.each do |apartment|
  Apartment.create!({
    address: apartment[:address],
    monthly_rent: apartment[:monthly_rent],
    sqft: apartment[:sqft],
    num_beds: apartment[:num_beds],
    num_baths: apartment[:num_baths]
    })
end

new_tenants =
  {:name=> "Jimmy Rollins", :age=> 27, :gender=> "M", :apartment_id=>20},
  {:name=> "Cal Ripken", :age=> 24, :gender=> "M", :apartment_id=>20},
  {:name=> "Kyle Hollingsworth", :age=> 40, :gender=> "M", :apartment_id=>20},
  {:name=> "Michael Kang", :age=> 42, :gender=> "M", :apartment_id=>20},
  {:name=> "Michael Travis", :age=> 45, :gender=> "M", :apartment_id=>20},
  {:name=> "Bill Nershi", :age=> 54, :gender=> "M", :apartment_id=>20},
  {:name=> "Keith Mosely", :age=> 49, :gender=> "M", :apartment_id=>20},
  {:name=> "Jason Hann", :age=> 39, :gender=> "M", :apartment_id=>20},
  {:name=> "Luke Skywalker", :age=> 34, :gender=> "M", :apartment_id=>20}

new_tenants.each do |tenant|
  Tenant.create!({
    name: tenant[:name],
    age: tenant[:age],
    gender: tenant[:gender],
    apartment_id: tenant[:apartment_id]
    })
end
