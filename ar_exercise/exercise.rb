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
first_tenants = Tenant.find(1)
# get all tenants older than 65
older_than_65 = Tenant.where("age > ?", 65)
# get all apartments whose price is greater than $2300
apartments_overprice = Apartment.where("monthly_rent > ?", 2300)
# get the apartment with the address "6005 Damien Corners"
apartment_address = Apartment.where(address: "6005 Damien Corners")
# get all tenants in that apartment
apartment_tenants = Tenant.where(apartment_id: == 6) # LOOK INTO THIS ONE

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |nameID|
  puts "ID: #{nameID.id}, Name: #{nameID.name}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all
all_apartments.each do |addressRent|
  puts "Address: #{addressRent.address}, Rent: #{addressRent.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |addressTenants|
  puts "Address: #{addressTenants.address}, Tenants: #{addressTenants.id == Tenant.id}"
end # LOOK INTO THIS ONE

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
apt1 = Apartment.create(address: '345 Petunia Lane', monthly_rent: 3452, sqft: 1000, num_beds: 2, num_baths: 1)
apt2 = Apartment.create(address: '2312 Walker Lane', monthly_rent: 312, sqft: 100, num_beds: 1, num_baths: 1)
apt3 = Apartment.create(address: '389 Georgia White Blvd', monthly_rent: 4452, sqft: 1241, num_beds: 3, num_baths: 2)
apt1.save
apt2.save
apt3.save
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
apt1.tenants.create([
  {name: "Carlos Rodriguez", age: 54, gender: "Male"},
  {name: "Pablo Escobar", age: 34, gender: "Male"},
  {name: "Jose Jalepeno", age: 12, gender: "Male"}
  ])
apt2.tenants.create([
  {name: "Jack Reacher", age: 32, gender: "Male"},
  {name: "Elaine Crofton", age: 31, gender: "Female"},
  {name: "Hannah Banana", age: 25, gender: "Female"}
  ])
apt3.tenants.create([
  {name: "Ted Mosby", age: 29, gender: "Male"},
  {name: "Marshall Ericson", age: 30, gender: "Male"},
  {name: "Lily Aldrin", age: 29, gender: "Female"}
  ])
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
Tenant.find_by(name: "Kristin Wisoky").update(age: 24)
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
update_apartment = Apartment.find_by(address: "62897 Verna Walk").update(num_beds: 3)
update_apartment.save
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
update_apartment_price = Apartment.find_by(address: "62897 Verna Walk").update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
tenants_under30 = Tenant.where('age < ?', 30)
# Delete their records from the DB
tenants_under30.destroy
