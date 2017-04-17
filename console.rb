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
# 1. See a list of all apartments (include ID#, address, and monthly rent)
Apartment.find_each do |apartment|
  puts "APT id:#{apartment.id}\nAPT address:#{apartment.address}\nATP rent:#{apartment.monthly_rent}"
end
# See a list of all tenants (include name and age)
Tenant.find_each do |tenant|
  puts "Name:#{tenant.name}\nAge: #{tenant.age}"
end
# See a list of all apartments and their associated tenants (just address and name)
Apartment.find_each do |apartment|
  puts apartment.address
  Tenant.find_each do |tenant|
    if apartment.id == tenant.apartment_id
      puts tenant.name
    end
  end
end

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
