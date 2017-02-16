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
first_tenant = Tenant.find(1)

# get all tenants older than 65
older_tenants = Tenant.where("age > 65")

# get all apartments whose price is greater than $2300
expensive_apt =
Apartment.where("monthly_rent > 2300")

# get the apartment with the address "6005 Damien Corners"
dc_apt = Apartment.find_by(address: "6005 Damien Corners")

# get all tenants in that apartment
all_tenants = tenant.apartments

# Use `each` and `puts` to:

# Display the name and ID # of every tenant
tenants.each do |tenant|
  puts "#{tenant.name} #{tenant.id}"
end

# Iterate over each apartment, for each apartment, display it's address and rent price
apartments.each do |apt|
  puts "#{apt.address} #{apt.monthly_rent}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
apartments.each do |apt|
  puts "#{apt.address}".join
end
  tenants.each do |tenant|
    puts "#{apt.name}"
  end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apartment_one = Apartment.create(address: "42 Fourth Avenue", monthly_rent: 500, sqft:2145, num_beds:3, num_baths:2)
apartment_two = Apartment.create(address:"920 East 40th", monthly_rent:2500, sqft:1160, num_beds:3, num_baths:1.5)
apartment_three = Apartment.create(address:"1014 Argo Lane", monthly_rent:1890, sqft:946, num_beds:1, num_baths:1)

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

addy = Tenant.create(name:"Addy Walker", age:25, gender:"female", apartment_id:21)
samantha = Tenant.create(name:"Samantha Parkington", age:25, gender:"female", apartment_id:21)
molly = Tenant.create(name:"Molly McIntire", age:25, gender:"female", apartment_id:25)
justin = Tenant.create(name:"Justin Tim", age:24, gender:"male", apartment_id:22)
joey = Tenant.create(name:"Joey Fat", age:28, gender:"male", apartment_id:22)
jc = Tenant.create(name:"JC Cha", age:28, gender:"male", apartment_id:22)
tom = Tenant.create(name:"Tommy Pickles", age:22, gender:"male", apartment_id:23)
ivy = Tenant.create(name:"Pamela Isley", age:30, gender:"female", apartment_id:24)
rose = Tenant.create(name:"Rose Isley", age:16, gender:"female", apartment_id:24)
hazel = Tenant.create(name:"Hazel Isley", age:16, gender:"female", apartment_id:24)

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
birthday = Tenant.find_by(name: "Krisin Wisoky")
birthday.update(age: 24)
birthday.save

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
rennovated= Apartment.find_by(address: "62897 Verna Walk")
rennovated.update(num_beds: 3)
rennovated.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
rennovated.update(monthly_rent: 1400)
rennovated.save

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
Tenant.where("age < 30").destroy_all
