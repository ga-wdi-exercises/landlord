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
  tenant =  Tenant.first
# get all tenants older than 65
older_than = Tenant.where('age < ?', 65)
# get all apartments whose price is greater than $2300
all_apartments = Apartment.where('price > ?', 2300)
# get the apartment with the address "6005 Damien Corners"
apartment = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_c = apartment.tenants


# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "Name: #{tenant.name}, Id: #{tenant.id}"
end


# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "Address is #{apartment.address}, rent: $#{apartment.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
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
harbor_point = Apartment.create(address: "606 Harbor Point", monthly_rent: 700, sqft: 1400, num_beds: 2, num_baths: 2)
the_envoy = Apartment.create(address: "2400 16th Street NW", monthly_rent: 2000, sqft: 620, num_beds: 1, num_baths: 1)
louis = Apartment.create(address: "1920 14th Street NW", monthly_rent: 2759, sqft: 627, num_beds: 1, num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
harbor_point.tenants.create(name: "Ethan Davila", age: 15, gender: "Female")
harbor_point.tenants.create(name: "John Davila", age: 56, gender: "Male")
harbor_point.tenants.create(name: "Eliana Davila", age: 18, gender: "Female")
the_envoy.tenants.create(name: "Mariana Lungu", age: 32, gender: "Female")
the_envoy.tenants.create(name: "Jonathan Davila", age: 28, gender: "Male")
the_envoy.tenants.create(name: "Victoria Davila", age:3, gender: "Male")
louis.tenants.create(name: "Irina Popescu", age: 26, gender: "Female")
louis.tenants.create(name: "Nicole Miller", age: 28, gender: "Female")
louis.tenants.create(name: "Oleg Hmeli", age: 30, gender: "Male")

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
# kristin = Tenant.find_by(name: "Kristin Wisoky")
# kristin.update(age: kristin.age + 1)
# kristen.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
Apartment.find_by(address: "62897 Verna Walk").increment(:num_beds, 1).save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
Apartment.update(monthly_rent: 2800).increment(monthly_rent: 400).save

# Millenial Eviction!
# Find all tenants who are under 30 years old
Tenant.destroy_all("age < 30")

# Delete their records from the DB
binding.pry
puts "hi"
