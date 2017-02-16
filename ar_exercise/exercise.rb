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
tenants_older_than_65 = Tenant.where('age > 65');
# get all apartments whose price is greater than $2300
expensive_apartments = Apartement.where('monthly_rent > 2300')
# get the apartment with the address "6005 Damien Corners"
6005_address = Apartment.find_by address: "6005 Damien Corners"
# get all tenants in that apartment
6005_tenants = Tenant.where(apartment_id: 6)
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts Tenant.id
  puts Tenant.name
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.each do |apartment|
  puts Apartment.address
  puts Apartment.monthly_rent
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.each do |apartment|
  puts apartment.address
  apartment.tenants.each do |tenant|
    puts tenant.name
  end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apt_one = Apartment.create(address: "123 New York Ave", monthly_rent: 2000, sqft: 888,num_beds: 1,num_baths: 3)
apt_two = Apartment.create(address: "456 New York Ave", monthly_rent: 2500, sqft: 888,num_beds: 3,num_baths: 4)
apt_three = Apartment.create(address: "789 New York Ave", monthly_rent: 6000, sqft: 888,num_beds: 2,num_baths: 4)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create([
  {name: "Abe Abington", age: 25, gender: "Male", apartment_id: 21},
  {name: "Betsy Bettison", age: 25, gender: "Female", apartment_id: 22},
  {name: "Carl Carter", age: 25, gender:"Male", apartment_id: 23},
  {name: "Dee Deson", age: 25, gender: "Female", apartment_id: 24},
  {name: "Eunice Eunch", age: 25, gender: "Female", apartment_id: 25},
  {name: "Fran Futer", age: 25, gender: "Female", apartment_id: 26},
  {name: "Greg Googiepants", age: 25, gender: "Male", apartment_id: 27},
  {name: "Harry Houdini", age: 25, gender: "Male", apartment_id: 28},
  {name: "Ian Iceman", age: 25, gender: "Male", apartment_id: 29},
]);
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristen.update( :age => 24)
kristen.save
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
62896_verna = Apartment.find_by(address:62897 Verna Walk)
62896_verna.update( :num_beds => 3)
62896_verna.save
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
62896_verna.update(:monthly_rent => 2800)
# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.where('age < 30', :age)
millenials.destory
