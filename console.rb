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
binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
