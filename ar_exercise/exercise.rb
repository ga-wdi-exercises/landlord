### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

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

################################################
#### NOTE: DON'T MODIFY ABOVE THIS LINE     ####
################################################


################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB
all_tenants = Tenant.all
all_apartments = Apartment.all
# get the first tenant in the DB
first_tenant = Tenant.find(1)
# get all tenants older than 65
old_tenants = Tenant.where('age > ?', 65)
# get all apartments whose price is greater than $2300
luxury_apartments = Apartment.where('monthly_rent > ?', 2300)
# get the apartment with the address "6005 Damien Corners"
damien_corner = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_corner_tenants = Tenant.where('apartment_id = ?',damien_corner.id)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each  do |tenant|
  puts [tenant.name, tenant.id]
end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments.each do |apartment|
  puts apartment.address, apartment.monthly_rent
  puts "*" * 30
 end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |apartment|
  puts apartment.address
  p Tenant.where('apartment_id = ?', apartment.id)
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
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
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
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
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
Tenant.find_by('name = ?', "Kristin Wisoky")
Tenant.update(2, :age => 24)
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
Apartment.find_by('address = ?', "62897 Verna Walk")
Apartment.update(9, :num_baths => 3)
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
Apartment.update(9, :monthly_rent => 400)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.where('age < ?', 30)
Tenant.delete(millenials)


binding.pry
puts "pry bug fix?"
