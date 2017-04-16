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
old_tenants = Tenant.where("age >= 65")

# get all apartments whose price is greater than $2300
expensive_apts = Apartment.where("monthly_rent >= 2300")

# get the apartment with the address "6005 Damien Corners"
damien = Apartment.where(address: "6005 Damien Corners")

# get all tenants in that apartment
damien_tnts = Tenant.where(apartment_id: 6)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
tenants_id = all_tenants.each do |tenant|
  puts "#{tenant.name} ID # is #{tenant.id}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all

apartment_info = all_apartments.each do |apartment|
  puts "#{apartment.address} is $#{apartment.monthly_rent} monthly"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
apartment_info2 = all_apartments.each do |apartment|
  puts "Residents of #{apartment.address} include #{apartment.tenants}" ##apartment.tenants doesn't show the names, but shows this: #<Tenant:0x007f9c8ab44280>
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
apartment1 = Apartment.create(address: "1600 Pennsylvania Ave", monthly_rent: 12, sqft: 54900, num_beds: 54, num_baths: 35)
apartment2 = Apartment.create(address: "8 Canal St", monthly_rent: 3000, sqft: 200, num_beds: 1, num_baths: 1)
apartment3 = Apartment.create(address: "7801 Mandan Rd", monthly_rent: 600, sqft: 1000, num_beds: 3, num_baths: 2)

apartment1.save
apartment2.save
apartment3.save

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
tenant1 = Tenant.create(name: "Leeroy Jenkins", age: 35, gender: "Male", apartment_id: 21)
tenant2 = Tenant.create(name: "Sheeroy Jenkins", age: 35, gender: "Female", apartment_id: 21)
tenant3 = Tenant.create(name: "Boy Jenkins", age: 15, gender: "Male", apartment_id: 21)
tenant4 = Tenant.create(name: "Girl Jenkins", age: 8, gender: "Female", apartment_id: 21)
tenant5 = Tenant.create(name: "Thomas Bangalter", age: 42, gender: "Male", apartment_id: 20)
tenant6 = Tenant.create(name: "Guy-Manuel de Homem-Christo", age: 43, gender: "Male", apartment_id: 20)
tenant7 = Tenant.create(name: "Hali Bakarr", age: 24, gender: "Female", apartment_id: 22)
tenant8 = Tenant.create(name: "Zayn Malik", age: 24, gender: "Male", apartment_id: 22)
tenant9 = Tenant.create(name: "Carmen Sandiego", age: 40, gender: "Female", apartment_id: 20)

tenant1.save
tenant2.save
tenant3.save
tenant4.save
tenant5.save
tenant6.save
tenant7.save
tenant8.save
tenant9.save

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristen = Tenant.find_by(name: "Kristin Wisoky")
kristen.age = 24
kristen.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_walk = Apartment.find_by(address: "62897 Verna Walk")
verna_walk.num_beds = 3
verna_walk.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_walk.monthly_rent += 400
verna_walk.save

# Millennial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millennials = Tenant.where("age < 30")
millennials.destroy_all

binding.pry
