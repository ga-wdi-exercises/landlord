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
tenants_over_65 = Tenant.where("age > ?", 65)
# get all apartments whose price is greater than $2300
apts_over_2300 = Apartment.where("monthly_rent > ?", 2300)
# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_corners_tenants = damien_corners.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
def tenant_names()
  Tenant.all.each do |tenant|
    puts "Name: #{tenant.name}, ID: #{tenant.id}"
  end
  return nil
end

# Iterate over each apartment, for each apartment, display it's address and rent price
def apartment_summaries()
  Apartment.all.each do |apartment|
    puts "#{apartment.address}, $#{apartment.monthly_rent}"
  end
  return nil
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
def apartment_tenants()
  Apartment.all.each do |apartment|
    apartment.tenants.each do |tenant|
      puts "#{apartment.address}, #{tenant.name}"
    end
  end
  return nil
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "123 Address Street", monthly_rent: 9999, sqft: 50, num_beds: 9, num_baths: 0)
Apartment.create(address: "1234 Place Blvd", monthly_rent: 20, sqft: 2000, num_beds: 0, num_baths: 5)
Apartment.create(address: "54321 Here Is A House Circle", monthly_rent: 2350, sqft: 2500, num_beds: 4, num_baths: 3)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
Tenant.create(name: "Name", age: 22, gender: "male", apartment_id: 3)
Tenant.create(name: "A Guy", age: 25, gender: "male", apartment_id: 5)
Tenant.create(name: "Tenantman", age: 42, gender: "male", apartment_id: 1)
Tenant.create(name: "Tenantwoman", age: 30, gender: "female", apartment_id: 3)
Tenant.create(name: "Someone", age: 80, gender: "female", apartment_id: 8)
Tenant.create(name: "Name 2", age: 12, gender: "male", apartment_id: 8)
Tenant.create(name: "Database Data", age: 2, gender: "female", apartment_id: 2)
Tenant.create(name: "Lorem Ipsum", age: 58, gender: "male", apartment_id: 2)
Tenant.create(name: "Word", age: 65, gender: "male", apartment_id: 1)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.age += 1

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_walk = Apartment.find_by(address: "62897 Verna Walk")
verna_walk.num_beds += 1

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_walk.monthly_rent += 400

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
def evict_millennials()
  millennials = Tenant.where("age < ?", 30)
    millennials.each |tenant|
      tenant.destroy
    end
  end
end

binding.pry

puts "end of application"
