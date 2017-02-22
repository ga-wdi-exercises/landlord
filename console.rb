require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

# seed script is not working so im just gonna make tha pp interface here.
puts "*" * 20 + "WELCOME" + "*" * 20

    # See a list of all apartments
    # See a list of all tenants
    # See a list of all apartments and their associated tenants
puts "1. View a list of all apartments"
puts "2. View a list of all tenants"
puts "3. View a list of all apartments and their associated tenants"

selection = gets.chomp.to_i
if selection == 1
   #(include ID, address, and monthly rent)
  apartment.each do |apartment|
    puts Apartment.apartment_id
    puts Apartment.address
    puts Apartment.monthly_rent
  end
elsif selection == 2
  #(include name and age)
  tenant.each do |tenant|
    puts Tenant.name
    puts Tenant.age
  end
elsif selection == 3
  #(just address and name)
  apartment.each do |apartment|
    puts apartment.address
    puts apartment.tenant.name
  end
end
#extended functionality::
# 4. Lordlord Login
# elsif selection == 4
# puts "1. Add a tenant"
#variables for class attributes  in next dialog
#Tenant.create function with user_input variable values
# puts "2. Evict a tenant"
#name for tenant class attribute collected
#Tenant.find_by user_input name
#output find_by result to confirm eviction
#1.Confirm 2.Cancel
#Tenant.destroy if user_input == 1
# puts "3. Change rent"
#What is the address of the apartment you are changing?
#user_input gets.chomp
# Apartment.find_by(address: user_input)
#either input the amount to increase rent by OR input the new rent amount
#rent_change = gets.chomp.to_i
#calc = apartment.monthly_rent + rent_change
#if rent_change < 500 ;
#puts you would like to change the rent of #{apartment.address} from $
#{apartment.monthly_rent} to $#{calc} Confirm?
#confirmation page ^^
#Apartment.increment(:monthly_rent, rent_change).save
#done!
#elsif ren_change > 500;
#puts you would like to change the rent of #{apartment.address} from $
#{apartment.monthly_rent} to $#{rent_change} Confirm?
#confirmation page ^^
#Apartment.update(monthly_rent: rent_change)
#done!
# puts "4. Move tenant"
#i have no idea where to start.
#probably tenant = find_by Tenant.name
#What address would you like to move #{tenant.name} to?
#newAddy = gets.chomp
#new_apt = Apartment.find_by (:address , newAddy)
#Are you sure you would like to move #{tenant.name} to #{new_apt}
#Apartment.tenant.create (tenant)
#THEN REMOVE FROM OLD APT BUILDING SOMEHOW... 
binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
