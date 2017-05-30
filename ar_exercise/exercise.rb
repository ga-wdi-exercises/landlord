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
old_tenants = Tenant.where(age > 65)

# get all apartments whose price is greater than $2300
exp_apartments = Apartment.where(monthly_rent > 2300)

# get the apartment with the address "6005 Damien Corners"
apartment_address = Apartment.find_by(address: "6005 Damien Corners")

# get all tenants in that apartment
all_tenantss = Tenant.find_by(apartment_id: 6)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "#{tenant.name}, #{tenant.id}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |aparment|
  puts "#{apartment.address}, #{apartment.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |aparment|
  puts "#{apartment.address}"
  Tenant.all.each do |tenant|
    puts "#{tenant.name}"
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
kazanci_apartment =  Apartment.create(address: "13249 Alcove Path", monthly_rent: 2000, sqft: 2500 , num_beds:3 , num_baths: 2)
kusol_apartment = Apartment.create(address: "4142 Monument Hills Way", monthly_rent: 3000, sqft: 3500, num_beds: 4, num_baths: 3)
anvarov_apartment =  Apartment.create(address: "3113 Cabot Dr", monthly_rent: 4000, sqft: 4500, num_beds: 5, num_baths: 4)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
kazanci_apartment.tenants.create((name: "Tarik Kazanci", age: 23, gender: "Male")
kazanci_apartment.tenants.create((name: "Fetah Kazanci", age: 56, gender: "Male")
kazanci_apartment.tenants.create((name: "Ayse Kazanci", age: 47, gender: "Female")
kazanci_apartment.tenants.create((name: "Omer Kazanci", age: 22, gender: "Male")

kusol_apartment.tenants.create((name: "Ahmet Kusol", age: 24, gender: "Male")
kusol_apartment.tenants.create((name: "Kadir Sever", age: 24, gender: "Male")

anvarov_apartment.tenants.create((name: "Alisher Anvarov", age: 30, gender: "Male")
anvarov_apartment.tenants.create((name: "Bahtiyor Anvarov", age: 19, gender: "Male")

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")

kristin.age += 1
kristin.save
# kristin.update(age: 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

verna_walk = Apartment.find_by(address: "62897 Verna Walk")
verna_walk.update(num_beds: 3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# verna_walk.monthly_rent += 400
verna_walk.update(monthly_rent: 2800)


# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

Tenant.destroy_all(age < 30)
