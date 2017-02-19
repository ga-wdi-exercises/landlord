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
all_apartments = Apartment.all

# get the first tenant in the DB
first_tenant = Tenant.first

# get all tenants older than 65
older_than_65 = Tenant.select{|t| t.age.to_i > 65 }

# get all apartments whose price is greater than $2300
apartment_price_above_2300 = Apartment.select {|ap| ap.monthly_rent.to_i > 2300}
#apartment_price_above_2300.each{|t| puts t.address}

# get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find {|ap| ap.address = "6005 Damien Corners"}
#puts damien_corners.address

# get all tenants in that apartment
damien_corners_tenants = Apartment.find {|ap| ap.address = "6005 Damien Corners"}.tenants
#damien_corners_tenants.each{|t| puts t.name}

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each {|t| puts "Tenant ID: #{t.id}; Tenant Name:'#{t.name}';"}
# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each {|ap| puts "Apartment ID: #{ap.id}; Apartment Address: #{ap.address}; Apartment Rent: #{ap.monthly_rent}"}
# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each do |ap|
  puts "Apartment ID: #{ap.id};"
  ap.tenants.each {|t| puts t.name}
end

################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `update`, `destroy`

# Create 3 new apartments, and save them to the DB

Apartment.where('address=? OR address=? OR address=?',"International Space Station #1", "Giza Pyramid", "Alexanria Library").destroy_all

apartment1= Apartment.create(address:"International Space Station #1", monthly_rent: 999999, sqft: 400, num_beds: 0, num_baths: 0)
apartment2= Apartment.create(address:"Giza Pyramid", monthly_rent: 99999, sqft: 50000, num_beds: 10, num_baths: 5)
apartment3= Apartment.create(address:"Alexanria Library", monthly_rent: 99999, sqft: 10000, num_beds: 10, num_baths: 5)
#Apartment.all.each {|ap| puts "Apartment ID: #{ap.id}; Apartment Address: #{ap.address}; Apartment Rent: #{ap.monthly_rent}"}

puts "*"*30
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
# Tenant.where('age > ?', 100).each {|t| puts t.name} # how to convert Age to integer
Tenant.where('age > ?', 100).destroy_all

superBestFriends1 = Tenant.create(name:"Jesus" , age:2016 , gender: 'male', apartment_id:5 )
superBestFriends2 = Tenant.create(name:"Muhammad" , age:1616 , gender:'male' , apartment_id:5 )
superBestFriends3 = Tenant.create(name:"Buddha" , age:4000 , gender:'male' , apartment_id:5 )
superBestFriends4 = Tenant.create(name:"Moses" , age:1900 , gender:'male' , apartment_id:5 )
superBestFriends5 = Tenant.create(name:"Joseph Smith" , age: 452 , gender:'male' , apartment_id:5 )
superBestFriends6 = Tenant.create(name:"Krishna" , age:6000 , gender:'male' , apartment_id:5 )
superBestFriends7 = Tenant.create(name:"Laozi" , age:3500 , gender:'male' , apartment_id:5 )
superBestFriends8 = Tenant.create(name:"Sea Man" , age:1000 , gender:'male' , apartment_id:5 )
superBestFriends9 = Tenant.create(name:"Chuhutlu" , age:1000 , gender:'male' , apartment_id:5 )

Tenant.all.each {|t| puts "ID: #{t.id}; Name: #{t.name}; Apartment ID: #{t.apartment_id}"}
puts "*"*30
# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
Tenant.all.find{|t| t.name == "Kristin Wisoky"}.update(age: Tenant.all.find{|t| t.name == "Kristin Wisoky"}.age+1)
puts Tenant.all.find{|t| t.name == "Kristin Wisoky"}.age
puts "*"*30
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
Apartment.all.find {|ap| ap.address == "62897 Verna Walk"}.update(num_beds: Apartment.all.find{|ap| ap.address =="62897 Verna Walk"}.num_beds+1)
puts Apartment.all.find{|ap| ap.address =="62897 Verna Walk"}.num_beds
puts "*"*30
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
Apartment.all.find {|ap| ap.address == "62897 Verna Walk"}.update(monthly_rent: Apartment.all.find{|ap| ap.address =="62897 Verna Walk"}.monthly_rent+400)
puts Apartment.all.find{|ap| ap.address =="62897 Verna Walk"}.monthly_rent
puts "*"*30

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
Tenant.where('age < ?', 30).destroy_all
Tenant.all.each {|t| puts "ID: #{t.id}; Name: #{t.name}; Age: #{t.age}"}
puts "*"*30
