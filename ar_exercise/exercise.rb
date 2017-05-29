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
binding.pry
# get the first tenant in the DB
first_tenant = Tenant.first
# get all tenants older than 65
above_65 = Tenant.find_by_sql("SELECT * FROM tenants WHERE age > 65")
# get all apartments whose price is greater than $2300
expensive_apartments = Apartment.where("monthly_rent > '2300'")
# get the apartment with the address "6005 Damien Corners"
apt_DC = Apartment.find_by_address("6005 Damien Corners")
# get all tenants in that apartment
apt_DC_res = Tenant.where("apartment_id = 6")
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
name_age_all = Tenant.all.each do |x|
	puts "#{x.name} #{x.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
address_rent_all = Apartment.all.each do |x|
	puts "#{x.address} #{x.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
apt_with_tenants = Apartment.all.each do |apt|
	puts "#{apt.address}"
		Tenant.all.each do |tenant|
			if tenant.apartment_id == apt.id
				puts "#{tenant}"
			else
				next
			end
		end
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
summit = Apartment.create(address: "215 Grant ave.", monthly_rent: 1200, sqft: 500, num_beds: 2,num_bath: 1)
pearl = Apartment.create(address: "616 Pearl ave.", monthly_rent: 1600, sqft: 1200, num_beds: 3,num_bath: 2)
copper_beach = Apartment.create(address: "300 Mile Ground rd.", monthly_rent: 1800, sqft: 1000, num_beds: 4,num_bath: 2)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
shmitty = Tenant.create(name: "Shmitty Werben-Jagerman-Jenson",age: 77,gender: "Male",apartment: summit)
sponge= Tenant.create(name: "Sponge-Bob Square-Pants",age: 26,gender: "Male",apartment: pearl)
patrick = Tenant.create(name: "Patrick Star",age: 27,gender: "Male",apartment: pearl)
sandy = Tenant.create(name: "Sandy Cheeks",age: 28,gender: "Female",apartment: pearl)
krabs = Tenant.create(name: "Mr. Krabs",age: 45,gender: "Male",apartment: copper_beach)
pk = Tenant.create(name: "Pearl Krabs",age: 19,gender: "Female",apartment: copper_beach)
squid = Tenant.create(name: "Squidward",age: 34,gender: "Male",apartment: copper_beach)
plank = Tenant.create(name: "Plankton",age: 28,gender: "Male",apartment: summit)
mm = Tenant.create(name: "Mermaid Man",age: 88,gender: "Male",apartment: copper_beach)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kris_wis = Tenant.find_by_name("Kristin Wisoky")
kris_wis.age = kris_wis.age + 1
kris_wis.save
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
verna_walk = Apartment.find_by_address("62897 Verna Walk")
verna_walk.num_beds += 1
verna_walk.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
verna_walk.monthly_rent += 400
verna_walk.save
# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.where("age < '30'")
millenials.destroy
