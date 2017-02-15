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
apartments = Apartment.all

# get the first tenant in the DB
first_tenant = Tenant.find(1)
# get all tenants older than 65
elderly = all_tenants.where("age > ?",65)
# get all apartments whose price is greater than $2300
expensive = apartments.where("monthly_rent > ?",2300)
# get the apartment with the address "6005 Damien Corners"
specific = Apartment.find_by address: "6005 Damien Corners"
# get all tenants in that apartment
Tenant.where(apartment_id: 6)
# Use `each` and `puts` \n'
# Display the name and ID # of every tenant
display_all = all_tenants.each do |tenant| puts "Name: #{tenant.name}\nID: #{tenant.id}" end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = apartments.each do |apt| puts "Address: #{apt.address}\n "
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

one = Apartment.create(address: '101 Apple Dr', monthly_rent: 400, sqft: 11000, num_beds: 1, num_baths: 7)

two = Apartment.create(address: '189 Blueberry Blvd', monthly_rent: 900, sqft: 1000, num_beds: 3, num_baths: 2)

three = Apartment.create(address: '888 Coconut Ct', monthly_rent: 700, sqft: 7000, num_beds: 1, num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
t_one = Tenant.create(name: "Bill", age: 27, gender: 'Male', apartment_id: 20)
t_two = Tenant.create(name: "Bob", age: 27, gender: 'Male', apartment_id: 20)
t_three = Tenant.create(name: "Parker", age: 26, gender: 'Male', apartment_id: 20)
t_four = Tenant.create(name: "John", age: 28, gender: 'Male', apartment_id: 20)
t_five = Tenant.create(name: "Sammmie", age: 18, gender: 'Female', apartment_id: 21)
t_six = Tenant.create(name: "Suzie", age: 18, gender: 'Female', apartment_id: 21)
t_seven = Tenant.create(name: "Bill", age: 27, gender: 'Male', apartment_id: 21)
t_eight = Tenant.create(name: "Zane", age: 25, gender: 'Male', apartment_id: 20)
t_nine = Tenant.create(name: "Gina", age: 24, gender: 'Female', apartment_id: 22)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

kristin = Tenant.find_by(name: 'Kristin Wisoky')
kristin.update(age: 24)
kristin.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

apt = Apartment.find_by(address: '62897 Verna Walk')
apt.update(num_beds: 3)
apt.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
apt.update(monthly_rent: 2800)
apt.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

millenials = Tenant.where("age < ?", 30)

millenials.destroy_all

binding.pry
