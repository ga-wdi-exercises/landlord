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
#
# # get the first tenant in the DB
first_tenant = Tenant.first
# # get all tenants older than 65
older_than_65 = Tenant.where("age > 65")
# # get all apartments whose price is greater than $2300
greater_than_2300 = Apartment.where("monthly_rent > 2300")
# # get the apartment with the address "6005 Damien Corners"
damien_corners = Apartment.find_by(address: "6005 Damien Corners")
# # get all tenants in that apartment
damien_tenants = damien_corners.tenants
#
# # Use `each` and `puts` to:
# # Display the name and ID # of every tenant
all_tenants.each { |tenant|
  puts "#{tenant.name} #{tenant.id}"
}
# # Iterate over each apartment, for each apartment, display it's address and rent price
Apartment.all.each { |apartment|
  puts "#{apartment.address} #{apartment.monthly_rent}"
}
# # Iterate over each apartment, for each apartment, display it's address and all of it's tenants
Apartment.all.each { |apartment|
  puts "#{apartment.address}"

  apartment.tenants.each { |tenant|
    puts "    #{tenant.id} #{tenant.name} #{tenant.age} #{tenant.gender} #{tenant.apartment_id}"
  }
}

# ################################################
# # CREATING / UPDATING / DELETING
# ################################################
#
# # Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`
#
# # Create 3 new apartments, and save them to the DB
hawthorne = Apartment.new(address: "699 Hawthorne Avenue", monthly_rent: 6500, sqft: 4000, num_beds: 10, num_baths: 10)
jefferson_davis = Apartment.new(address: "1212 Jefferson Davis HW", monthly_rent: 3000, sqft: 2500, num_beds: 3, num_baths: 2)
winter = Apartment.new(address: "36 Winter St", monthly_rent: 1000, sqft: 2000, num_beds: 3, num_baths: 2)
hawthorne.save
jefferson_davis.save
winter.save

# # Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
jill = Tenant.create(name: "Jill Withers", age: 22, gender: "Female", apartment_id: 21)
max = Tenant.create(name: "Max Withers", age: 24, gender: "Male", apartment_id: 21)
eli = Tenant.create(name: "Eli Larkey", age: 39, gender: "Male", apartment_id: 20)
kevin = Tenant.create(name: "Kevin Daniels", age: 32, gender: "Male", apartment_id: 20)
pam = Tenant.create(name: "Pamela Noris", age: 28, gender: "Female", apartment_id: 20)
edie = Tenant.create(name: "Edith Martin", age: 27, gender: "Female", apartment_id: 20)
jim = Tenant.create(name: "Jim Matthews", age: 30, gender: "Male", apartment_id: 20)
laurie = Tenant.create(name: "Laurie Connors", age: 35, gender: "Female", apartment_id: 20)
amy = Tenant.create(name: "Amy Ellis", age: 22, gender: "Female", apartment_id: 22)


# # Note: you'll use this little bit of code as a `seeds.rb` file later on.
#
# # Birthday!
# # It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# # Note: She's in the seed data, so she should be in your DB
kristen = Tenant.find_by(name: "Kristin Wisoky")
kristen.age += 1
kristen.save
# # Rennovation!
# # Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# # Make sure to save the results to your database
verna = Apartment.find_by(address: "62897 Verna Walk")
verna.num_beds += 1
verna.save

# # Rent Adjustment!
# # Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# # to reflect the new bedroom
verna.monthly_rent += 400
verna.save
#
# # Millenial Eviction!
# # Find all tenants who are under 30 years old
millenials = Tenant.where("age < 30")
# # Delete their records from the DB
millenials.destroy_all
