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
first_tenant = Tenant.first!
# get all tenants older than 65
tenants_over_sixtyfive = Tenant.where "age > 65"
# get all apartments whose price is greater than $2300
apartments_bougie = Apartment.where "monthly_rent > 2300"
# get the apartment with the address "6005 Damien Corners"
apartment_dam_cor = Apartment.find_by address:"6005 Damien Corners"
# get all tenants in that apartment
tenants_dam_cor = Tenant.find_by apartment_id:Apartment.find_by(address:"6005 Damien Corners").id

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.all.each do |tenant|
  puts "#{tenant.name} #{tenant.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "#{apartment.address} #{apartment.monthly_rent}"
end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts "#{apartment.address} #{Tenant.find_by(apartment_id: apartment.id) ? Tenant.find_by(apartment_id: apartment.id).name : ''}"
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address:"123 Easy St", monthly_rent: 1000, sqft: 2000, num_beds:5, num_baths:4)
Apartment.create(address:"321 Hard St", monthly_rent: 1500, sqft:69, num_beds:1, num_baths:5)
Apartment.create(address:"64 Hard Knock Life Ln", monthly_rent: 450, sqft:100, num_beds:0, num_baths:1)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name:"Bob Loblaw", age:45, gender:"Male", apartment_id: 21)
Tenant.create(name:"Tobias Funke", age:40, gender:"Male", apartment_id: 20)
Tenant.create(name:"Lindsay Funke", age:40, gender:"Female", apartment_id: 20)
Tenant.create(name:"GOB", age:42, gender:"Male", apartment_id: 20)
Tenant.create(name:"Michael Bluth", age:40, gender:"Male", apartment_id: 20)
Tenant.create(name:"Maebe Funke", age:16, gender:"Female", apartment_id: 20)
Tenant.create(name:"George Michael Bluth", age:16, gender:"Male", apartment_id: 20)
Tenant.create(name:"Lucille Bluth", age:70, gender:"Female", apartment_id: 22)
Tenant.create(name:"Buster Bluth", age:45, gender:"Male", apartment_id: 22)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
Tenant.update(Tenant.find_by(name:"Kristin Wisoky").id, :age=> Tenant.find_by(name:"Kristin Wisoky").age + 1)
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
Apartment.update(Apartment.find_by(address:"62897 Verna Walk").id, :num_beds => Apartment.find_by(address:"62897 Verna Walk").num_beds + 1, :sqft => Apartment.find_by(address:"62897 Verna Walk").sqft + 400, :monthly_rent => Apartment.find_by(address:"62897 Verna Walk").monthly_rent + 400)
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
Tenant.where("age<30").destroy_all

binding.pry
