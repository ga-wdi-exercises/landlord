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
old_folks = Tenant.where "age > 65"

# get all apartments whose price is greater than $2300
expensive_apartments = Apartment.where "monthly_rent > 2300"

# get the apartment with the address "6005 Damien Corners"
damien_corners_apt = Apartment.find_by(address: '6005 Damien Corners')

# get all tenants in that apartment
damien_corners_tenants = Apartment.find_by(address: '6005 Damien Corners').tenants


# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant|
  puts "#{tenant.name} has an ID of #{tenant.id}."
end

# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each do |apartment|
  puts "#{apartment.address} costs $#{apartment.monthly_rent}/month."
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |apartment|
  puts "#{apartment.address} houses #{Tenant.find_by(apartment_id: apartment.id) ? Tenant.find_by(apartment_id: apartment.id).name : 'no one'}."
end



################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create({ :address => "Chamber of Sages", :monthly_rent => 1, :sqft => 400, :num_beds => 6, :num_baths => 0 })
Apartment.create({ :address => "5 Treehouse Lane", :monthly_rent => 500, :sqft => 5000, :num_beds => 1, :num_baths => 1})
Apartment.create({ :address => "Hyrule Castle", :monthly_rent => 60000, :sqft => 50000, :num_beds => 100, :num_baths => 99})

# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create({ :name => "Link", :age => 18, :gender => "Male", apartment_id => 22})
Tenant.create({ :name => "Princess Zelda", :age => "18", :gender => "Female", apartment_id => 23})
Tenant.create({ :name => "Ganondorf", :age => 35, :gender => "Male", apartment_id => 23})
Tenant.create({ :name => "Navi", :age => 1, :gender => "Female", apartment_id => 22})
Tenant.create({ :name => "Rauru", :age => 1000, :gender => "Male", apartment_id => 21})
Tenant.create({ :name => "Saria", :age => 8, :gender => "Female", apartment_id => 21})
Tenant.create({ :name => "Darunia", :age => 37, :gender => "Male", apartment_id => 21})
Tenant.create({ :name => "Princess Ruto", :age => 18, :gender => "Female", apartment_id => 21})
Tenant.create({ :name => "Impa", :age => 46, :gender => "Female", apartment_id => 21})
Tenant.create({ :name => "Nabooru", :age => 29, :gender => "Female", apartment_id => 21})

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
kristin = Tenant.find_by(name: "Kristin Wisoky")
kristin.update(age: kristin.age + 1)

# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
verna_walk = Apartment.find_by(address: "62897 Verna Walk")
verna_walk.update(num_beds: verna_walk.num_beds + 1)
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
verna_walk.update(monthly_rent: verna_walk.monthly_rent + 400)
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
youngins = Tenant.where "age < 30"
youngins.destroy_all
# Delete their records from the DB

binding.pry
