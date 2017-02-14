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
tenants_over_65 = Tenant.where("age > 65", :age)


# get all apartments whose price is greater than $2300
apartments_over2300 = Apartment.where("monthly_rent > 2300", :monthly_rent)

# get the apartment with the address "6005 Damien Corners"
apartment_damien = Apartment.find_by(address:  "6005 Damien Corners")

# get all tenants in that apartment
tenants_damien = Apartment.find_by(address:  "6005 Damien Corners").tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "Name: #{tenant.name}, ID: #{tenant.id}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "Address: #{apartment.address}, Rent: #{apartment.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts apartment.address
  apartment.tenants.each do |tenant|
    puts tenant.name
  end
  puts "*" * 50
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
laurel = Apartment.create(address: "323 Thomas Drive", monthly_rent: 700, sqft: 750, num_beds: 2, num_baths: 1)
the_greens = Apartment.create(address: "361 The Greens Circle", monthly_rent: 975, sqft: 780, num_beds: 1, num_baths: 1)
hue = Apartment.create(address: "300 West Hargett Street", monthly_rent: 1175, sqft: 640, num_beds: 2, num_baths: 2)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
laurel.tenants.create(name: "Ebenezer Williams", age: 28, gender: "Male")
laurel.tenants.create(name: "Allan Langat", age: 28, gender: "Male")
laurel.tenants.create(name: "Hamid Zouaoui", age: 28, gender: "Male")
the_greens.tenants.create(name: "Neil Samen", age: 28, gender: "Male")
the_greens.tenants.create(name: "James Namude", age: 28, gender: "Male")
the_greens.tenants.create(name: "Ruth Sims", age: 28, gender: "Female")
hue.tenants.create(name: "Bianca Pau", age: 28, gender: "Female")
hue.tenants.create(name: "Quinn Nam", age: 28, gender: "Female")
hue.tenants.create(name: "Andrew Chan", age: 28, gender: "Male")
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
Tenant.find_by(name: "Kristin Wisoky").increment(:age, 1).save


# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

verna = Apartment.find_by(address: "62897 Verna Walk")
verna.update(num_beds: 3)


# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

verna.increment(:monthly_rent, 400)


# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB

Tenant.destroy_all("age < 30")

binding.pry
