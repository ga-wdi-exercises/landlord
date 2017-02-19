### : Make sure you've loaded the seeds.sql file into your DB before starting
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
#### : DON'T MODIFY ABOVE THIS LINE     ####
################################################


################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

# Use Active record to do the following, and store the results **in a variable**
# example: get every tenant in the DB

all_tenants = Tenant.all

# puts all_tenants
#
# get the first tenant in the DB
#
firstTenant = Tenant.first

# get all tenants older than 65
#
seniors = Tenant.where("age > 65", :age)

# get all apartments whose price is greater than $2300
#
luxuryFlats = Apartment.where("monthly_rent > 2300", :monthly_rent)


# "SELECT * FROM apartments WHERE monthly_rent > 2300;"

# get the apartment with the address "6005 Damien Corners"

damcorn = Apartment.find_by(address: "6005 Damien Corners")
# get all tenants in that apartment

# damcorn.tenants.each {|t| puts t.name}

puts "*"*30

# Use `each` and `puts` to:
# Display the name and ID # of every tenant

# Tenant.all.each { |t| puts t.name + " " + t.id.to_s }

# Iterate over each apartment, for each apartment, display it's address and rent price

# Apartment.all.each {|a| puts a.address + " " + a.monthly_rent.to_s}

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

# Apartment.all.each do |a|
#    puts "Apartment: #{a.address}, Tenants:"
#     a.tenants.each {|t| puts t.name}
# end


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# address, monthly_rent, sqft, num_beds, num_baths
Apartment.where('address=? OR address=? OR address=?', "36 Southern Slope Dr", "15 Wake Forrest Rd", "1 Test St.").destroy_all

Apartment.create(address: '36 Southern Slope Dr', monthly_rent: 2500, sqft: 3000, num_beds: 4, num_baths: 3)
Apartment.create(address: '15 Wake Forrest Rd', monthly_rent: 500, sqft: 200, num_beds: 1, num_baths: 1)
Apartment.create(address: '1 Test St.', monthly_rent: 900, sqft: 1000, num_beds: 2, num_baths: 2)

# Apartment.all.each do |a|
#    puts "Apartment: #{a.address}"
#  end

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)

# Tenant.where('name=? OR name=? OR name=? OR name=? OR name=? OR name=? OR name=? OR name=? OR name=?', "Admiral Adama","Colonel Tye", "Starbuck", "Apollo", "Helio", "Dr Gaius Baltar", "The Doc", "Chief", "President Roslin").destroy_all
#
# Tenant.create(name: "Admiral Adama", age: 62, gender: "Male", apartment_id: 21)
# Tenant.create(name:"Colonel Tye", age:62,gender: "Male", apartment_id: 21)
# Tenant.create(name:"Starbuck", age:35,gender: "Female", apartment_id: 21)
# Tenant.create(name:"Apollo", age:36,gender: "Male", apartment_id: 22)
# Tenant.create(name:"Helio", age:32,gender: "Male", apartment_id: 22)
# Tenant.create(name:"Dr Gaius Baltar", age:45,gender: "Male", apartment_id: 22)
# Tenant.create(name:"The Doc", age:67,gender: "Male", apartment_id: 23)
# Tenant.create(name:"Chief", age:38,gender: "Male", apartment_id: 23)
# Tenant.create(name:"President Roslin", age:63,gender: "Female", apartment_id: 23)  #Hardcoded the apartment_id's. Was there a better way?
#
# Tenant.all.each {|t| puts t.name}

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
KW = Tenant.find_by(name: "Kristin Wisoky")

# KW.age = KW.age + 1
# puts KW


# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

verna = Apartment.find_by(address: "62897 Verna Walk")

puts verna[:num_beds] 
verna[:num_beds] = verna[:num_beds] + 1
puts verna[:num_beds]

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
