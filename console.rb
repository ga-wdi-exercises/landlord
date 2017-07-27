require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# Build out a simple command line interface that provides a menu prompt and allows
# the user to:
#
# 1. See a list of all apartments (include ID#, address, and monthly rent)
# 2. See a list of all tenants (include name and age)
# 3. See a list of all apartments and their associated tenants (just address and name)

puts "1 Apartment List"
puts "2 Tenant List,"
puts "3 View of Apartment & Tenants,"
input = gets.chomp

Apartment.each do |apartment|
  if input == "1"
    puts "ID: #{apartment.id}, address: #{apartment.address}, price: #{apartment.monthly_rent}"
  end
end

Tenant.each do |tenant|
  if input == "2"
    puts "Id: #{tenant.id}, name: #{tenant.name}, age: #{tenant.age}"
  end
end

# Apartment.each do |apartment|
#  if input == "3"
#     puts "address: #{apartment.address}"
#         Tenant.each do |tenant|
#           puts tenant.name
#         end
#     end

 binding.pry

 puts "ignore this line, it's just here so the binding.pry above work
