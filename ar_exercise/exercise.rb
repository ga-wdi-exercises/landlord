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
senior_tenants = Tenant.where("age > ?", 65)
# get all apartments whose price is greater than $2300
pricey = Apartment.where("monthly_rent > ?", 2300)
# get the apartment with the address "6005 Damien Corners"
dam = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment
dam_tenants = dam.tenants
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |ten|
  puts "Tenant : #{ten.name}, ID : #{ten.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all
all_apartments.each do |apt|
  puts "Address : #{apt.address}, Rent : #{apt.monthly_rent}"
end
puts ""
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |apt|
  puts ""
  puts "Address : #{apt.address}"
  puts "Tenants : "
  tenArry = apt.tenants
  tenArry.each do |ten|
    puts "#{ten.name}"
  end
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apt1 = Apartment.new(address: '123 fake st', monthly_rent: 450, sqft:500, num_beds: 1, num_baths: 0)
apt2 = Apartment.new(address: '321 Drury Lane', monthly_rent: 550, sqft:700, num_beds: 1, num_baths: 1)
apt3 = Apartment.new(address: '742 Evergreen Ter', monthly_rent: 1500, sqft:1400, num_beds: 4, num_baths: 2)
apt1.save
apt2.save
apt3.save
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
lbart = Tenant.create(name: 'El barto', age: 10, gender: "Male", apartment_id: 20)
milhouse = Tenant.create(name: 'Milhouse', age: 10, gender: "Male", apartment_id: 20)
muffinman = Tenant.create(name: 'Muffinman', age: 40, gender: "Male", apartment_id: 21)
muffinwoman = Tenant.create(name: 'Muffinwoman', age: 36, gender: "Female", apartment_id: 21)
homer = Tenant.create(name: 'Homer', age: 38, gender: "Male", apartment_id: 22)
marge = Tenant.create(name: 'Marge', age: 35, gender: "Female", apartment_id: 22)
bart = Tenant.create(name: 'Bart', age: 10, gender: "Male", apartment_id: 22)
lisa = Tenant.create(name: 'Lisa', age: 8, gender: "Female", apartment_id: 22)
maggie = Tenant.create(name: 'Maggie', age: 1, gender: "Female", apartment_id: 22)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
kristin = Tenant.find_by(name: 'Kristin Wisoky')
kristin.age += 1
kristin.save
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
verna = Apartment.find_by(address: '62897 Verna Walk')
verna.num_beds += 1
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
verna.monthly_rent += 400
verna.save
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
millenials = Tenant.where("age < ?", 30)
# Delete their records from the DB
millenials.each do |millenial|
  millenial.destroy
end
binding.pry
puts ""
