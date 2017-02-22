###  Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise
require "bundler/setup"
require "pg"
require "active_record"
require "pry"

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
aarp_tenants = Tenant.where("age > ?", 65)
# get all apartments whose price is greater than $2300
expensive_apt = Apartment.where("monthly_rent > ?", 2300)
# get the apartment with the address "6005 Damien Corners"
damien_addr = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
damien_addr.tenants

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "#{tenant.name}, #{tenant.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "#{apartment.address}, #{apartment.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: "1234 House Drive", monthly_rent: 200, sqft: 120, num_beds: 1, num_baths: 1)
Apartment.create(address: "2500 Panda Bear Lane", monthly_rent: 2000, sqft: 1200, num_beds: 2, num_baths: 1)
Apartment.create(address: "5600 Pants Circle", monthly_rent: 2500, sqft: 2400, num_beds: 3, num_baths: 2)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: "Madonna Donna", age: 100 , gender: "female", apartment_id: 3)
Tenant.create(name: "Frank Frankleburg", age: 25 , gender: "male", apartment_id: 7)
Tenant.create(name: "Felicia Bye", age: 37, gender: "female", apartment_id: 5)
Tenant.create(name: "Unicorn Glitterfarts", age: 12, gender: "female", apartment_id: 6)
Tenant.create(name: "Pumpkin Piecakes", age: 6, gender: "male", apartment_id: 1)
Tenant.create(name: "Sparkle Scooterpants", age: 55, gender: "female", apartment_id: 9)
Tenant.create(name: "Person Persons", age: 45, gender: "male", apartment_id: 3)
Tenant.create(name: "Manhands Pearson", age: 22, gender: "female", apartment_id: 2)
Tenant.create(name: "Pokemon NoMore", age: 85, gender: "male", apartment_id: 4)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.age += 1

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(address: "62897 Verna Walk")
verna.num_beds += 1

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.monthly_rent += 400

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millennials_out = Tenant.where("age < ?", 30)
millennials_out.destroy

binding.pry

puts "end of application"
