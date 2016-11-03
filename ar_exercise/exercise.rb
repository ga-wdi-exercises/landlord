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

first_tenant = Tenant.find(1) #first_tenant = Tenant.find_by(:id, 1)

# get all tenants older than 65

older_tenants = Tenant.where("age > 65")

# get all apartments whose price is greater than $2300

expensive_apartment = Apartment.where("monthly_rent > 2300")

# get the apartment with the address "6005 Damien Corners"

apartment_address = Apartment.find_by(address: "6005 Damien Corners")


# get all tenants in that apartment
tenants_names = Tenant.where(apartment_id:  6);

# Use `each` and `puts` to:
# Display the name and ID # of every tenant
all_tenants = Tenant.all
all_tenants.each {|tenant| puts "#{tenant[:id]} #{tenant[:name]}"}


# Iterate over each apartment, for each apartment, display it's address and rent price

apartment_info = Apartment.all
apartment_info.each {|apartment| puts " The apartment in #{apartment[:address]} costs #{apartment[:monthly_rent]} a month"}

# Iterate over each apartment, for each apartment, display it's address and all of it's tenants

apartment_info.each do |apartment|
  puts apartment[:id]
  all_tenants.each do |tenant|
    if apartment[:id] == tenant[:apartment_id]
      puts tenant.name
    end
  end
end


################################################
# CREATING / UPDATING / DELETING
################################################

# Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`

# Create 3 new apartments, and save them to the DB
old_st = Apartment.new(address: "23 Old st.", monthly_rent: 2000, sqft: 1800, num_beds: 3, num_baths: 2)
old_st.save
new_rd = Apartment.new(address: "100 New Rd.", monthly_rent: 2600, sqft: 800, num_beds: 2, num_baths: 1)
new_rd.save
young_ave = Apartment.new(address: "65 Young Ave.", monthly_rent: 1000, sqft: 1200, num_beds: 3, num_baths: 2)
young_ave.save


# Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Note: you'll use this little bit of code as a `seeds.rb` file later on.
#


def get_tenant_data

  new_tenants= {
  'Sue Jacobs' => {
    name:'Sue Jacobs',
    age: 18,
    gender: 'Female',
    apartment_id: 4
  },
    'Steve Martin' => {
      name:'Steve Martin',
      age: 45,
      gender: 'Male',
      apartment_id: 7
    },
      'Bob Marks' => {
        name:'Bob Marks',
        age: 78,
        gender: 'Male',
        apartment_id: 9
      },
        'Marta Roses' => {
          name: 'Marta Roses',
          age: 24,
          gender: 'Female',
          apartment_id: 2
        },
          'April Summers'=> {
          name: 'April Summers',
          age: 35,
          gender: 'Female',
          apartment_id: 7}
      }

end
    # 'Mark Ronalds', 87,'Male', 9},
    # 'Sean Thomas', 44, 'Male',3},
    # 'Lola Sanchez', 33, 'Female', 2},
    # 'Kevin Spanx', 29, 'Male', 5}


# Birthday!
# It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# Note: She's in the seed data, so she should be in your DB

# Rennovation!
# Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# Make sure to save the results to your database

# Rent Adjustment!
# Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# to reflect the new bedroom

# Millenial Eviction!
# Find all tenants who are under 30 years old
# Delete their records from the DB
puts "Welcome to your Building Management System Application"
puts "Enter 1 to see an overview of your apartments.\n"
puts "Enter 2 to see all tenant information."
data_pick = gets.chomp.to_i

if data_pick == 1
  puts "You now have all access to all the apartment information. There is a total of 20 apartments"
  puts " *********\n"
  puts "Pick from the following options to view specific apartment information:\n
      1 for apartment addresses\n
      2 for apartment square footage\n
      ls3 for monthly rent"
  apt_info = gets.chomp.to_i

  if apt_info == 1
     apartments.each do |apartment|
       puts " ID:#{apartment[:id]} Address: #{apartment[:address]}"
      end
 elsif apt_info == 2
     apartments.each do |apartment|
       puts " ID:#{apartment[:id]} Square Footage: #{apartment[:square_feet]}"
     end
 else
     apartments.each do |apartment|
       puts " ID:#{apartment[:id]} Monthly Rent: #{apartment[:monthly_rent]}"
     end
 end

end

if data_pick ==2
  puts "You now have access to all the tenant information.\n Pick from the following options:"
  puts "To view specific tenant information, pick from the following list:\n
       Enter 1 for tenant name\n
       Enter 2 for tenant age\n
       Enter 3 for the apartment id of each tenant"
  tenant_info = gets.chomp.to_i


  if tenant_info == 1
    tenants.each do |tenant|
      puts " ID:#{tenant[:id]} Name: #{tenant[:name]}"
     end
  elsif tenant_info == 2
    tenants.each do |tenant|
      puts "ID:#{tenant[:name]} Age: #{tenant[:age]}"
     end
  else
    apartments.each do |apartment|
      tenants.each do |tenant|
        if tenant[:apartment_id] == apartment[:id]
          puts  "  #{ tenant[:apartment_id]}  #{tenant[:name]}  #{apartment[:address]}\n" + " ****"
        end
      end
    end
  end


end

binding.pry
