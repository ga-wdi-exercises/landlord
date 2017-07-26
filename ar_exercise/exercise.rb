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

# get the first tenant in the DB
first_tenant = Tenant.first

# get all tenants older than 65
old_tenants = Tenant.where("age > ?", 65)

# get all apartments whose price is greater than $2300
fancy_apartments = Apartment.where("monthly_rent > ?", 2300)

# get the apartment with the address "6005 Damien Corners"
dam_corners = Apartment.find_by(address: "6005 Damien Corners")

# get all tenants in that apartment
dam_corners_tenants = Apartment.find_by(address: "6005 Damien Corners").tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |ten|
  puts "Name: #{ten.name}, ID: #{ten.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apt|
  puts "Address: #{apt.address}, Rent Price: $#{apt.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apt|
  puts "Tenants living at #{apt.address} include #{(Tenant.where(apartment_id: apt.id).pluck(:name)).join(", ")}"
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "123 ABC St", monthly_rent: 950, sqft: 1000, num_beds: 3, num_baths: 2)
Apartment.create(address: "456 Sesame St", monthly_rent: 850, sqft: 1200, num_beds: 4, num_baths: 2)
Apartment.create(address: "789 Alleyway Lane", monthly_rent: 450, sqft: 400, num_beds: 1, num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Tenant.create(name: 'Minny Mouse', age: 70, gender: 'Female', apartment_id: 1);
Tenant.create(name: 'Mickey Mouse', age: 75, gender: 'Male', apartment_id: 1);
Tenant.create(name: 'Daisy Duck', age: 30, gender: 'Female', apartment_id: 2);
Tenant.create(name: 'Donald Duck', age: 40, gender: 'Male', apartment_id: 2);
Tenant.create(name: 'Goofy Dog', age: 50, gender: 'Male', apartment_id: 3);
Tenant.create(name: 'Foghorn Leghorn', age: 60, gender: 'Male', apartment_id: 4);
Tenant.create(name: 'Bugs Bunny', age: 25, gender: 'Male', apartment_id: 5);
Tenant.create(name: 'Babs Bunny', age: 26, gender: 'Female', apartment_id: 5);
Tenant.create(name: 'Tweety Bird', age: 20, gender: 'Female', apartment_id: 9);
Tenant.create(name: 'Sylvester Cat', age: 30, gender: 'Male', apartment_id: 9);

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristen = Tenant.find_by(name: "Kristin Wisoky")
kristen.age +=1
kristen.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
reno = Apartment.find_by(address: "62897 Verna Walk")
reno.num_beds +=1
reno.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
reno.monthly_rent += 400
reno.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.where("age < ?", 30)
millenials.destroy_all

binding.pry
puts "EOF"
