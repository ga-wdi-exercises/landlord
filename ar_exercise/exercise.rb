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
over65_tenants = Tenant.where("age > 65" )



# get all apartments whose price is greater than $2300
hirent=Apartment.where ("monthly_rent > 2300")
# get the apartment with the address "6005 Damien Corners"
damienlot=Apartment.find_by address: '6005 Damien Corners'
# get all tenants in that apartment
damient_lot_tenants=Tenant.where ("apartment_id = "+damienlot.id.to_s)



# Use `each` and `puts` to:
# Display the name and ID # of every tenant
Tenant.find_each do |user|
  puts "#{user[:name]}  #{user[:id]}"
end


# Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.find_each do |user|
  puts "#{user[:address]}  #{user[:monthly_rent]}"
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
#select  a.address, b.name from apartments a, tenants b where a.id = b.apartment_id order by a.address;

Apartment.includes(:tenants).find_each do |apartment|
    address_printed = false
    apartment.tenants.each do |tenant|
        # print tenant details
        puts "Address: #{apartment.address}" if !address_printed
        puts " Tennant: #{tenant.name}"
        address_printed=true
    end
end
################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB

# Apartment.find_by(address: '123 Main St')
# Apartment.find_by(address: "2525 Chasbarb Terrace ").destroy
# Apartment.apt=Apartment.find_by(address: "13 B Givens Lane").destroy
newapts= Apartment.create([
  {address: "123 Main St", monthly_rent: 3200.00, sqft: 2500, num_beds: 5, num_baths: 3 },
  {address: "2525 Chasbarb Terrace ", monthly_rent: 2865.00, sqft: 1500, num_beds: 3, num_baths: 2 },
  {address: "13 B Givens Lane", monthly_rent: 1200.00, sqft: 1850, num_beds: 4, num_baths: 2 },
])

apt=Apartment.find_by address: '123 Main St'

puts newapts
apt=Apartment.find_by address: '123 Main St'
puts apt[:id]


#Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
#INSERT INTO tenants (name, age, gender, apartment_id) VALUES ('Maudie Mosciski', 90, 'Female', 1);
apt=Apartment.find_by address: '123 Main St'
newtenants= Tenant.create([
  {name: "Michael Rubin", age: 61 , gender: "Male", apartment_id: apt.id },
  {name: "Ellen Rubin", age: 63 , gender: "Female", apartment_id: apt.id },
  {name: "Bari Appelstein", age: 65 , gender: "Female", apartment_id: apt.id },
  {name: "Mark Appelstein", age: 67 , gender: "Male", apartment_id: apt.id },
  {name: "Barry Rubin", age: 28 , gender: "Male", apartment_id: apt.id },
  {name: "Erin Bryce", age: 30, gender: "Female", apartment_id: apt.id },
  {name: "Bill Bryce", age: 33 , gender: "Male", apartment_id: apt.id },
  {name: "Liam Bryce", age: 1, gender: "Male", apartment_id: apt.id },
  {name: "Sarah Jo Bryce", age: 65 , gender: "Female", apartment_id: apt.id },
])
#
# # Birthday!
# # It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# # Note: She's in the seed data, so she should be in your DB
#
 tenant=Tenant.find_by(name:"Kristin Wisoky")
  p tenant
 tenant.age +=1
 tenant.save
 p tenant

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

apartment=Apartment.find_by(address:"62897 Verna Walk")
p apartment
apartment.num_baths +=1
apartment.save
p apartment


# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
apartment.monthly_rent +=400
apartment.save
p apartment


# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
u30=under30_tenants = Tenant.where("age < 30" )
puts "List of Tenants under 30 Before Delete"
p u30
u30.delete_all
u30=under30_tenants = Tenant.where("age < 30"  )
puts "List of Tenants under 30 after"
p u30
a=Tenants.all
p a

binding.pry
