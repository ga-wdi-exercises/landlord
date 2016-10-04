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
seniors = Tenant.where("age > 65")

# get all apartments whose price is greater than $2300
luxury_apts = Apartment.where("monthly_rent > 2300")

# get the apartment with the address "6005 Damien Corners"
damien = Apartment.where("address = '6005 Damien Corners'").take

# get all tenants in that apartment
damien.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.find_each do |t|
  puts "#{t.id}: #{t.name}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.find_each do |a|
  puts "Address: #{a.address} | Price: $#{a.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.find_each do |a|
  puts "Address: #{a.address}"
  tenants = a.tenants
  tenants.find_each do |t|
    puts "    - #{t.name}"
  end
end




################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "2259 12th St NW", monthly_rent: 1760, sqft: 1400, num_beds: 2, num_baths: 1)
Apartment.create(address: "5221 Nebraska Ave NW", monthly_rent: 3600, sqft: 2400, num_beds: 4, num_baths: 2)
Apartment.create(address: "646 Orleans Pl NE", monthly_rent: 1800, sqft: 1300, num_beds: 2, num_baths: 1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Tenant.create(name: "Tim", age: 26, gender: "male", apartment_id: 24)
Tenant.create(name: "Jack", age: 26, gender: "male", apartment_id: 24)
Tenant.create(name: "Joe", age: 26, gender: "male", apartment_id: 26)
Tenant.create(name: "Trey", age: 24, gender: "male", apartment_id: 25)
Tenant.create(name: "Andrew", age: 24, gender: "male", apartment_id: 5)
Tenant.create(name: "Moses", age: 29, gender: "male", apartment_id: 10)
Tenant.create(name: "Jonathan", age: 99, gender: "male", apartment_id: 7)
Tenant.create(name: "Rachel", age: 29, gender: "male", apartment_id: 12)
Tenant.create(name: "Jessica", age: 29, gender: "male", apartment_id: 1)


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
# kristin = Tenant.find_by(name: "Kristin Wisoky")
# kristin.update(age: 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
# verna = Apartment.find_by(address: "62897 Verna Walk")
# verna.update(num_beds: 3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
# verna.update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
# millenials = Tenant.where("age < 30")
# millenials.destroy_all

binding.pry
