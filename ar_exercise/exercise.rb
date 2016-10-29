### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging
#
# class Tenant < ActiveRecord::Base
#   belongs_to :apartment
# end
#
# class Apartment < ActiveRecord::Base
#   has_many :tenants
# end

################################################
#### NOTE: DON'T MODIFY ABOVE THIS LINE     ####
################################################


################################################
# FINDING / SELECTING
################################################

# Hint, the following methods will help: `where`, `all`, `find`, `find_by`

require_relative "../models/apartment" # require the Artist class definition that we defined in the models/artist.rb file
require_relative "../models/tenant" # require the Artist class definition that we defined in the models/artist.rb file
require_relative "../db/connection"
# Use Active record to do the following, and store the results **in a variable**

# example: get every tenant in the DB
all_tenants = Tenant.all
all_apartments = Apartment.all

# --------- Step 4 ---------
loop do


response = gets.chomp.to_i

#1
if response == 1
  all_apartments.each do |apt|
    puts "#{apt[:id]} #{apt[:address]} #{apt[:monthly_rent]}"
  end

  puts ' '
  puts '*' * 50
  puts ' '

#2
elsif response == 2

  all_tenants.each do |person|
    puts "#{person[:name]} #{person[:age]}"
  end

  puts ' '
  puts '*' * 50
  puts ' '
#3
elsif response == 3
  all_apartments.each do |apt|
    puts " "
    puts "The address: #{apt[:address]}"
    all_tenants.each do |person|
      if person[:apartment_id] == apt[:id]
        puts "    >> #{person[:name]} #{person[:apartment_id]}"
      end
    end
  end
end
break if response == 99
end
# --------- Homework exercises ---------

# # get the first tenant in the DB
# firstGuy = Tenant.first
#
# # get all tenants older than 65
#   all_tenants.each do |person|
#     if person[:age] > 65
#       # puts "#{person[:name]} #{person[:age]}"
#     end
#   end
#
# # get all apartments whose price is greater than $2300
#   all_apartments.each do |apt|
#     if apt[:monthly_rent] > 2300
#       # puts "#{apt[:monthly_rent]}"
#     end
#   end
#
# # get the apartment with the address "6005 Damien Corners"
#   aptAdd = all_apartments.select {|apt| apt[:address] == "6005 Damien Corners"}
#   # puts aptAdd[0][:id]
#
# # get all tenants in that apartment
#   thatPerson = all_tenants.select {|person|  person[:apartment_id] == aptAdd[0][:id]}
#     # puts thatPerson[0][:apartment_id]
#
# # Use `each` and `puts` to:
#
# # Display the name and ID # of every tenant
#   all_tenants.each do |person|
#     # puts "#{person[:name]} #{person[:id]}"
#   end
#
# # Iterate over each apartment, for each apartment, display it's address and rent price
#   all_apartments.each do |apt|
#     # puts "#{apt[:address]} #{apt[:monthly_rent]}"
#   end
# # Iterate over each apartment, for each apartment, display it's address and all of it's tenants
# all_apartments.each do |apt|
#   # puts " "
#   # puts "The address: #{apt[:address]}"
#   all_tenants.each do |person|
#     if person[:apartment_id] == apt[:id]
#       # puts "    >> #{person[:name]} #{person[:apartment_id]}"
#     end
#   end
# end
#
# ################################################
# # CREATING / UPDATING / DELETING
# ################################################
#
# # Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`
#
# # Create 3 new apartments, and save them to the DB
# testApt1 = Apartment.create(address: "1617 Carlin Ln", monthly_rent: 10000, sqft: 10000, num_beds: 7, num_baths: 6)
# testApt2 = Apartment.create(address: "stuff", monthly_rent: 999, sqft: 999, num_beds: 1, num_baths: 1)
# testApt3 = Apartment.create(address: "The Box on the Corner", monthly_rent: 10, sqft: 15, num_beds: 0, num_baths: 0)
#
# # Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
# # Note: you'll use this little bit of code as a `seeds.rb` file later on.
# guy1 = Tenant.create(name: "guy1", age: 30, gender: "Male", apartment_id: 1)
# guy2 = Tenant.create(name: "guy2", age: 30, gender: "Male", apartment_id: 2)
# guy3 = Tenant.create(name: "guy3", age: 30, gender: "Male", apartment_id: 3)
# guy4 = Tenant.create(name: "guy4", age: 30, gender: "Male", apartment_id: 4)
# guy5 = Tenant.create(name: "guy5", age: 30, gender: "Male", apartment_id: 5)
# guy6 = Tenant.create(name: "guy6", age: 30, gender: "Male", apartment_id: 6)
# guy7 = Tenant.create(name: "guy7", age: 30, gender: "Male", apartment_id: 7)
# guy8 = Tenant.create(name: "guy8", age: 30, gender: "Male", apartment_id: 8)
# guy9 = Tenant.create(name: "guy9", age: 30, gender: "Male", apartment_id: 9)
#
#
# # Birthday!
# # It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
# # Note: She's in the seed data, so she should be in your DB
#
#   kristin = Tenant.where(name:"Kristin Wisoky")
#   # puts kristin[0][:age]
#   # kristin[0][:age] += 1
#   # puts kristin[0][:age]
#
# # Rennovation!
# # Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
# # Make sure to save the results to your database
#
#   verna = Apartment.where(address:"62897 Verna Walk")
#   # puts verna[0][:num_beds]
#   verna[0][:num_beds] +=1
#   # puts verna[0][:num_beds]
#
# # Rent Adjustment!
# # Update the same apartment that you just 'rennovated'. Increase it's rent by $400
# # to reflect the new bedroom
#
# # puts verna[0][:monthly_rent]
# verna[0][:monthly_rent] += 400
# # puts verna[0][:monthly_rent]
#
# # Millenial Eviction!
# # Find all tenants who are under 30 years old
# # Delete their records from the DB
# puts all_tenants
#
#   all_tenants.each do |person|
#     if person[:age] < 30
#       Tenant.destroy(person[:id])
#     end
#   end
