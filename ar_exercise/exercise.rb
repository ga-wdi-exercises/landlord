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
first = Tenant.first
# get all tenants older than 65
seniors = Tenant.select do |x|
  x[:age] >= 65
end

# get all apartments whose price is greater than $2300
gentrification = Apartment.select {|x| x.monthly_rent > 2300}

# get the apartment with the address "6005 Damien Corners"
omen = Apartment.find_by_address("6005 Damien Corners")
# get all tenants in that apartment
# coven = Tenant.where(:apartment_id => omen[:id])
# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants.each do |tenant|
  puts "#{tenant.name} has id #{tenant.id}"
end
# Iterate over each apartment, for each apartment, display it's address and rent price
all_apartments = Apartment.all
all_apartments.each do |apt|
  puts "#{apt.address} has a rent of $#{apt.monthly_rent}."
end

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants
all_apartments.each do |apt|
  puts "#{apt.address}'s tenants are: "
  all_tenants.each do |tenant|
    if tenant[:apartment_id] == apt[:id]
      puts "#{tenant.name}"
    end
  end
  #{all_tenants.where(:apartment_id => apt.id)}."
end



################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
this = Apartment.create(:address =>"1234 this lane", :monthly_rent => 700, :sqft => 1400, :num_beds => 2, :num_baths => 1)
that = Apartment.create(:address =>"5678 that lane", :monthly_rent =>700, :sqft => 1400, :num_beds => 2, :num_baths => 1)
cool = Apartment.create(:address =>"420 cool st", :monthly_rent =>666, :sqft => 2100, :num_beds => 3, :num_baths =>2)
a = Tenant.create(name: "Adam", age: 30, gender: "Male", apartment_id: 3)
b = Tenant.create(name: "Dan", age: 31, gender: "Male", apartment_id: 2)
c = Tenant.create(name: "Fran", age: 32, gender: "Male", apartment_id: 3)
d = Tenant.create(name: "Frank", age: 33, gender: "Male", apartment_id: 1)
e = Tenant.create(name: "Francis", age: 34, gender: "Male", apartment_id: 2)
f = Tenant.create(name: "Francine", age: 35, gender: "Female", apartment_id: 2)
g = Tenant.create(name: "Francois", age: 36, gender: "Male", apartment_id: 1)
h = Tenant.create(name: "Frankford", age: 37, gender: "Male", apartment_id: 3)
i = Tenant.create(name: "France", age: 65, gender: "Male", apartment_id: 3)
binding.pry

# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB
kris = Tenant.where(name:"Kristin Wisoky").update(:age => 24)
# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database
rennovate = Apartment.where(address: "62897 Verna Walk")
rennovate.update(:num_beds => rennovate[0][:num_beds]+=1)
# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom
rennovate.update(:monthly_rent => rennovate[0][:monthly_rent]+=1)

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
millenials = Tenant.select {|x| x.age < 30}
millenials.each do |y|
  Tenant.destroy(y[:id])
end

def menuscreen  tenants,  apartments
puts "###################################################"
puts "Welcome to landlord.ly, the premier landlording app"
puts "###################################################"
puts "1. list all tenants"
puts "2. list all apartments"
puts "3. view apartments with current tenants"
puts "4. search apartment by tenant"
puts "5. remove tenant from apartment"
puts "6. add new tenant"
puts "9. exit"
menu = gets.chomp.to_i
case menu
when 1
   tenants.each do |name|
    puts "#{name.name}"
  end
  puts ""
  menuscreen  tenants,  apartments
when 2
   apartments.each do |apt|
    puts "#{apt.address}"
  end
  puts ""
  menuscreen  tenants,  apartments
when 3
   apartments.each do |apt|
     tenants.each do |name|
      if apt.id == name.apartment_id
    puts "#{apt.address}, occupied by #{name.name}\n"
  end
end
  end
  puts ""
  menuscreen  tenants,  apartments
when 4
  puts "enter tenant name"
  search = gets.chomp
   apartments.each do |apt|
     tenants.each do |name|
  if search == name.name && apt.id == name.apartment_id
    puts "#{name.name} lives at #{apt.address}\n"
end
end
end
puts ""
menuscreen  tenants,  apartments
when 5
  puts "removing tenant: enter tenant name"
  search = gets.chomp
   tenants.each do |name|
  if search == name.name
    name.apartment_id = nil  #there's gotta be a better way to do this
  end
end
puts "#{search} has been removed"
puts ""
menuscreen  tenants,  apartments
when 6
  puts "new tenant name"
  newname = gets.chomp
  puts "new tenant id"
  newid = gets.chomp
  puts "new tenant age"
  newage = gets.chomp
  puts "new tenant apartment_id"
  newapt = gets.chomp
 tenants << Tenant.new(newid, newname, newage, newapt)
puts "#{newname} has been added"
puts ""
menuscreen  tenants,  apartments

when 9
  puts "enjoy your idle wealth!!"
else
  puts "not a valid response\n\n"
  menuscreen  tenants,  apartments
end
end

menuscreen all_tenants, all_apartments







#lkasjdfj
