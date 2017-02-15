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
    first_tenant = Tenant.find 1
# # # get all tenants older than 65
    old_tenants = Tenant.where('age > 65', :age)
# # # get all apartments whose price is greater than $2300
    price_check = Apartment.where('monthly_rent > 2300', :monthly_rent)
# # get the apartment with the address "6005 Damien Corners"
    get_address = Apartment.where(address: "6005 Damien Corners")
# # get all tenants in that apartment
    damien_corners_tenants = Tenant.where(apartment_id: 6)

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
  Tenant.all.each do |tenant|
    puts tenant.name
    puts tenant.id
  end
# Iterate over each apartment, for each apartment, display it's address and rent price
  Apartment.all.each do |apartment|
    puts apartment.address
    puts apartment.monthly_rent
  end
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
  Apartment.all.each do |apartment|
    puts apartment.address
    apartment.tenants.each do |tenant|
      puts tenant.name
    end
  end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
    new_apt_one = Apartment.create(address: "1600 Penn Ave", monthly_rent: 6000, sqft: 67888,num_beds: 17,num_baths: 35)
    new_apt_two = Apartment.create(address: "2000 Penn Ave", monthly_rent: 6500, sqft: 84722,num_beds: 30,num_baths: 40)
    new_apt_three = Apartment.create(address: "7800 Penn Ave", monthly_rent: 8908, sqft: 76235,num_beds: 30,num_baths: 40)
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
 Tenant.create([
   {name: "Ziggy Marley", age: 40, gender: "Male", apartment_id: 6},
   {name: "Rick Grimes", age: 45, gender: "Male", apartment_id: 19},
   {name: "Norman Redus", age: 44, gender:"Male", apartment_id: 7},
   {name: "Sansa Stark", age: 25, gender: "Female", apartment_id: 9},
   {name: "Arya Stark", age: 19, gender: "Female", apartment_id: 3},
   {name: "Jon Snow", age: 32, gender: "Male", apartment_id: 2},
   {name: "Norma Bates", age: 45, gender: "Female", apartment_id: 13},
   {name: "Norman Bates", age: 19, gender: "Male", apartment_id: 13},
   {name: "Frank Underwood", age: 57, gender: "Male", apartment_id: 10},
 ]);

# Note: you'll use this little bit of code as a `seeds.rb` file later on.

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
    wisoky = Tenant.find_by(name:'Kristin Wisoky')
    wisoky_bday = wisoky.update(:age => 24)

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
    verna = Apartment.find_by(address: '62897 Verna Walk')
    verna_moreroom = verna.update(:num_beds => 3 )
    verna.save

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
    verna_rentup = verna.update(:monthly_rent => 2800)


# Millenial Eviction!
# Find all tenants who are under 30 years old
    millenials = Tenant.where('age < 30', :age)
# Delete their records from the DB
    bye_millenials = millenials.destroy

binding.pry
puts "end of file"
