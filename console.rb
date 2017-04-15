require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working
#
# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
# puts "*" * 50
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."

value = 0
while value < 5 do
puts "Welcome, landlord! To see a list of all your apartments, press 1. \n
To see a list of all your tenants, press 2.\n
To see a list of apartments and their tenants, press 3"
response = gets.chomp.to_i
  if response == 1
    puts Apartment.select('address, monthly_rent')
  elsif
    response == 2
    puts Tenant.select('name, address')
  elsif
    response == 3
    all_apartments = Apartment.all
    all_apartments.each do
      puts all_apartments.tenants
    end
    end
  end

end




# 1. See a list of all apartments (include ID#, address, and monthly rent)
# 2. See a list of all tenants (include name and age)
# 3. See a list of all apartments and their associated tenants (just address and name)


binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
