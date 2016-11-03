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
puts all_tenants.first.inspect
# get all tenants older than 65
puts all_tenants.where("age > 65").inspect
# get all apartments whose price is greater than $2300
apartments = Apartment.all
puts apartments.where("monthly_rent > 2300").inspect
# get the apartment with the address "6005 Damien Corners"
damien_corners = apartments.where(address: '6005 Damien Corners').first

puts damien_corners.inspect

# get all tenants in that apartment
puts damien_corners.tenants.inspect
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each { |tenant| puts "name: #{tenant.name} id: #{tenant.id}"  }

# Iterate over each apartment, for each apartment, display it's address and rent price
apartments.each { |apartment| puts "address: #{apartment.address} rent: $#{apartment.monthly_rent}"  }
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
apartments.each { |apartment|
  puts "Address: #{apartment.address}"
  puts "Residents:"
  apartment.tenants.each { |tenant|
    puts tenant.inspect
  }
}

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
new_apartments = []

for i in (0..2)
  apartment = Apartment.new(address: "#{rand(0..1000)} Cherry St", monthly_rent: i+1 * 500, num_beds: i+1, num_baths: i+1, sqft: i+1 * 1000)
  apartment.save
  new_apartments << apartment
end

new_apartments.each { |apartment|
  3.times {
    apartment.tenants.create(name: "Renter #{rand(1..1000)}", age: rand(18..50), gender: ["Male", "Female"].sample)
  }
}

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.where(name:"Kristin Wisoky").first
kristin.age += 1
kristin.save


# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

verna_app = Apartment.find_by(address: "62897 Verna Walk")

verna_app.num_beds += 1
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_app.monthly_rent += 400
verna_app.save
# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
Tenant.destroy_all("age < 30")
