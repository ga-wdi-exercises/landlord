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
tennants_65 = Tenant.where("age > '65'")
# get all apartments whose price is greater than $2300
apartments_rent_high = Apartment.where("monthly_rent > '2300'")
# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by address: "6005 Damien Corners"
# get all tenants in that apartment
corners_residents = Tenant.find_by apartment_id: damien_corners.id

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each { |tenant| puts "#{tenant.name} - #{tenant.id}"}
# Iterate over each apartment, for each apartment, display it's address and rent price
apartments = Apartment.all?
apartments.each { |apt| puts "#{apt.address} - #{apt.monthly_rent}"}
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |item|
    puts "#{apt.address}"
    all_tenants.each do |tenant|
        puts tenant.name if tenant.apartment_id == apt.id
    end
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
apt1 = Apartment.create(address: "2422 Sampha Lane.",monthly_rent: 2300,sqft: 1000,num_beds: 2,num_baths: 2)
apt2 = Apartment.create(address: "711 Road",monthly_rent: 2400,sqft: 1100,num_beds: 2,num_baths: 2)
apt3 = Apartment.create(address: "Tobacco Hill",monthly_rent: 750,sqft: 720,num_beds: 1,num_baths: 1)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
carti = Tenant.create(name: "Playboi Carti",age: 21,gender: "Male",apartment_id: 5)
rocky = Tenant.create(name: "Rocky Balboa",age: 44,gender: "Male",apartment_id: 3)
fergenstein = Tenant.create(name: "John Fergenstein",age: 29,gender: "Male",apartment_id: 6)
julia = Tenant.create(name: "julia lovebird",age: 36,gender: "Female",apartment_id: 2)
lily = Tenant.create(name: "lily munchkin",age: 25,gender: "Female",apartment_id: 7)
kelly = Tenant.create(name: "Kelly Burke",age: 19,gender: "Female",apartment_id: 1)
kendrick = Tenant.create(name: "kendrick lamar",age: 29,gender: "Male",apartment_id: 7)
cynthia = Tenant.create(name: "Cynthia Mcbay",age: 26,gender: "Female",apartment_id: 1)
charles = Tenant.create(name: "Charles Barkley",age: 45,gender: "Male",apartment_id: 9)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kristen = Tenant.find_by(name: 'Kristin Wisoky')
kristen.update(age: 24)
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna = Apartment.find_by(address: '62897 Verna Walk')
verna.update(num_beds: 3)

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna.update(monthly_rent: 2800)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.where("age < '30'")
millenials.destroy_all
