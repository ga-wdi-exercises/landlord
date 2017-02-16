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
#all_tenants = Tenant.all

# get the first tenant in the DB
#first_tenant = Tenant[0]  or
# first_tenant = Tenant.first
# get all tenants older than 65
#older = Tenant.where("age > 65", :age)
# get all apartments whose price is greater than $2300
#pricey = Apartment.where("monthly_rent > 2300", :monthly_rent)
# get the apartment with the address "6005 Damien Corners"
#app1 = Apartment.where(address: "6005 Damien Corners")

# get all tenants in that apartment

#Apartment.find_by(address: "6005 Damien Corners").tenants


# Use `each` and `puts` to:

# Display the name and ID # of every tenant
# Tenant.all.each do |tenant|
#  puts "name: #{tenant.name}, Id: #{tenant.id}"
#  end

# Iterate over each apartment, for each apartment, display it's address and rent price

  #  Apartment.all.each do |apartment|
  #  puts "address: #{apartment.address}, rent_price: #{apartment.monthly_rent}"
  #  end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

# Apartment.all.each do |apartment|
# puts "address: #{apartment.address}"
# apartment.tenants.each do |tenant|
#   puts "name: #{tenant.name}"
# end
# end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB
# Apartment.create([
#   {address:"1209 chillum road",
#   monthly_rent: "1200",
#   sqft: "600",
#   num_beds:"1",
#   num_baths:"1"},
#
#   {address:"3320 beverly hills",
#   monthly_rent: "1900",
#   sqft: "700",
#   num_beds:"2",
#   num_baths:"2"},
#
#   {address:"3320 belair",
#   monthly_rent: "2900",
#   sqft: "900",
#   num_beds:"2",
#   num_baths:"3"}
# ])

# apartment23 = Apartment.create(address:"3509 chillum ave",
# monthly_rent: "1200",
# sqft: "600",
# num_beds:"1",
# num_baths:"1")
#
# apartment24 = Apartment.create(address:"2109 beverly hills top",
# monthly_rent: "1200",
# sqft: "600",
# num_beds:"1",
# num_baths:"1")
#
# apartment25 = Apartment.create(address:"1209 mandelaway",
# monthly_rent: "1200",
# sqft: "600",
# num_beds:"1",
# num_baths:"1")
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# apartment23.tenants.create([
#   {name: "john",
#   age: 40,
#   gender: "male"},
#
#   {name: "missy",
#    age: 40,
#     gender: "female"
#   },
#
#  {name: "molly",
#   age: 40,
#   gender: "female"}
# ])
#
# apartment24.tenants.create([
#   {name: "micheal",
#   age: 40,
#   gender: "male"},
#
#   {name: "mona",
#    age: 40,
#     gender: "female"
#   },
#
#  {name: "mina",
#   age: 40,
#   gender: "female"}
# ])
#
# apartment25.tenants.create([
#   {name: "sunny",
#   age: "40",
#   gender: "male"},
#
#   {name: "sasha",
#    age: 40,
#     gender: "female"
#   },
#
#  {name: "malia",
#   age: 40,
#   gender: "female"}
# ])
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older. Kristin Wisoky
# Note: She's in the seed data, so she should be in your DB


#kristin = Tenant.find_by(name: "Kristin Wisoky")
# kristin.update(age: 24)
# kristin.save
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
# verna = Apartment.find_by(address: "62897 Verna Walk")
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# millenial = Tenant.where(age: 30)
# Delete their records from the DB
# millenial.destroy_all
# Tenant.where(age: 30) => []
binding.pry

puts "end of file"
