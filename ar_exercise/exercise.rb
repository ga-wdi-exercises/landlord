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
old_tenants = Tenant.find_by("age > ?" , 65)
# get all apartments whose price is greater than $2300
apartment_pricey = Apartment.where("monthly_rent > ?", 2300)
# get the apartment with the address "6005 Damien Corners"
apart_dam = Apartment.find_by(address: = "6005 Damien Corners")
# get all tenants in that apartment
apart_dam_ten = Apartment.find_by(address: = "6005 Damien Corners").tenants.all
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
id_name_ten = Tenant.all.each do |person|
  puts person.name
  puts person.id
end
# Iterate over each apartment, for each apartment, display it's address and rent price
id_name_ten = Apartments.all.each do |place|
  puts place.address
  puts place.id
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
id_name_ten = Apartments.all.each do |place|
  puts place.address
  Tenant.all.each do |person|
    if person.apartment_id == place.id
      puts person.name
    end end

end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
Apartment.create(address: '911 Main Street', monthly_rent: 5000, sqft: 1400, num_beds: 2, num_baths: 22)
Apartment.create(address: '912 Main Street', monthly_rent: 7000, sqft: 1700, num_beds: 2, num_baths: 2)
Apartment.create(address: '913 Main Street', monthly_rent: 6000, sqft: 1900, num_beds: 32, num_baths: 2)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
Tenant.create(name: 'Thomas Tank', age: '16', gender: 'Train', apartment_id: 1)
Tenant.create(name: 'Steve Spiel', age: '16', gender: 'Train', apartment_id: 2)
Tenant.create(name: 'Mark Jacobs', age: '16', gender: 'Train', apartment_id: 3)

Tenant.create(name: 'Dolphin Bob', age: '16', gender: 'Train', apartment_id: 1)
Tenant.create(name: 'Henry Rollins', age: '16', gender: 'Train', apartment_id: 2)
Tenant.create(name: 'Manning Pate', age: '16', gender: 'Train', apartment_id: 3)

Tenant.create(name: 'Darth Maul', age: '16', gender: 'Train', apartment_id: 1)
Tenant.create(name: 'Dakota Fanny', age: '16', gender: 'Train', apartment_id: 2)
Tenant.create(name: 'Tib Dibbler', age: '16', gender: 'Train', apartment_id: 3)


# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
Tenant.find_by(name: 'Kristin Wisoky').update(age: 24)
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
Apartment.find_by(address: '62897 Verna Walk').update(num_beds: 3)
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
Apartment.find_by(address: '62897 Verna Walk').update(monthly_rent: += 400)
# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.where('age < 30')
