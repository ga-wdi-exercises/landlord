# ### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
# ### this exercise
#
# require "pg" # postgres db library
# require "active_record" # the ORM # for debugging
#
# # ActiveRecord::Base.establish_connection(
# #   :adapter => "postgresql",
# #   :database => "landlord"
# # )
#
# # class Tenant < ActiveRecord::Base
# #   belongs_to :apartment
# # end
# #
# # class Apartment < ActiveRecord::Base
# #   has_many :tenants
# # end
#
# ################################################
# #### NOTE: DON'T MODIFY ABOVE THIS LINE     ####
# ################################################
#
#
# ################################################
# # FINDING / SELECTING
# ################################################
#
# # Hint, the following methods will help: `where`, `all`, `find`, `find_by`
#
# # Use Active record to do the following, and store the results **in a variable**
# # example: get every tenant in the DB
# all_tenants = Tenant.all
#
# # get the first tenant in the DB
# tenant_1 = Tenant.first
# # get all tenants older than 65
# tenant_older_than_65 = Tenant.where("age  > ?", 65)
# # get all apartments whose price is greater than $2300
# tenant_price_greater_2300 = Apartment.where("monthly_rent > ?", 2300)
# # get the apartment with the address "6005 Damien Corners"
# specific_apartment = Apartment.find_by(address: "6005 Damien Corners")
# # get all tenants in that apartment
# specific_apartment.tenants
# # Use `each` and `puts` to:
# # Display the name and ID # of every tenant
# Tenant.all.each |tenant| do
#   puts "#{tenant.name}: #{tenant.id}"
# end
# # Iterate over each apartment, for each apartment, display it's address and rent price
# Apartment.all.each |apartment| do
#   puts "#{apartment.address}: #{apartment.monthly_rent}"
# end
# # Iterate over each apartment, for each apartment, display it's address and all of it's tenants
# Apartment.all.each |apartment| do
#   puts "#{apartment.address}: #{apartment.tenants}"
# end
# ################################################
# # CREATING / UPDATING / DELETING
# ################################################
#
# # Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`
#
# # Create 3 new apartments, and save them to the DB
# Apartment.create(address: "707 Foxhound Road", monthly_rent: 707, sqft: 1000, num_beds: 10, num_baths: 7)
# Apartment.create(address: "900 Foxsound Road", monthly_rent: 1000, sqft: 1200, num_beds: 15, num_baths: 9 )
# Apartment.create(address: "704 Foxbound Road", monthly_rent: 407, sqft: 8000, num_beds: 4, num_baths: 3 )
#
# # Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# Tenant.create(name: "Alex", age: 90, gender: "male", apartment_id: 19 )
# Tenant.create(name: "Sarah", age: 37, gender: "female", apartment_id: 17 )
# Tenant.create(name: "Blue", age: 88, gender: "male", apartment_id: 34 )
# Tenant.create(name: "Killa", age: 44, gender: "male", apartment_id: 32 )
# Tenant.create(name: "Milla", age: 30, gender: "female", apartment_id: 8 )
# Tenant.create(name: "Wavelength", age: 40, gender: "male", apartment_id: 12 )
# Tenant.create(name: "Suburban", age: 50, gender: "female", apartment_id: 15 )
# Tenant.create(name: "Rock", age: 70, gender: "male", apartment_id: 20 )
# Tenant.create(name: "Cornerstone", age: 77, gender: "male", apartment_id: 37 )
#
# # Note: you'll use this little bit of code as a `seeds.rb` file later on.
#
# # Birthday!
# # It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# # Note: She's in the seed data, so she should be in your DB
# kristin = Tenant.find_by(name: "Kristin Wisoky")
# kristin.age += 1
# kristin.save
# # Rennovation!
# # Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# # Make sure to save the results to your database
# verna = Apartment.find_by(address: "62897 Verna Walk")
# verna.num_beds += 1
# verna.save
# # Rent Adjustment!
# # Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# # to reflect the new bedroom
# verna.monthly_rent += 400
# verna.save
# # Millenial Eviction!
# # Find all tenants who are under 30 years old
# youngones = Tenant.where("age < ?", 30)
# # Delete their records from the DB
# youngones.destroy_all
