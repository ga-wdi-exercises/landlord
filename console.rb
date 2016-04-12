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

# binding.pry

2.times {puts "*" * 70}
puts "Welcome to Landlord"
puts "Options:"
puts "1) See all apartments"
puts "2) See all tenants"
puts "3) See all apartments and associated tenants"
2.times {puts "*" * 70}
puts ""
puts "Please enter your selection"

input = gets.chomp.to_i

case input
when 1
  puts 'All apartments'
  puts 'ID    | Address                  | Rent   | Sq Feet  | Beds | Baths'
  puts '*' * 70
  all_apartments = Apartment.all
  all_apartments.each do |apartment|
    print apartment.id, (' ' * (6-apartment.id.to_s.length)), '| ',
      apartment.address, (' ' * (25-apartment.address.to_s.length)), '| ',
      apartment.monthly_rent, (' ' * (7-apartment.monthly_rent.to_s.length)), '| ',
      apartment.sqft, (' ' * (9-apartment.sqft.to_s.length)), '| ',
      apartment.num_beds, (' ' * (5-apartment.num_beds.to_s.length)), '| ',
      apartment.num_baths
    puts ''
  end

when 2
  puts 'All tenants'
  puts 'ID    | Name                   | Gender         | Age   | Apartment ID'
  puts '*' * 70
  all_tenants = Tenant.all
  all_tenants.each do |tenant|
    print tenant.id, (' ' * (6-tenant.id.to_s.length)), '| ',
      tenant.name, (' ' * (23-tenant.name.to_s.length)), '| ',
      tenant.gender, (' ' * (15-tenant.gender.to_s.length)), '| ',
      tenant.age, (' ' * (6-tenant.age.to_s.length)), '| ',
      tenant.apartment_id
    puts ''
  end

when 3
  puts 'Apartments listed with associated tenants'
  all_apartments = Apartment.all
  all_tenants = Tenant.all
  all_apartments.each do |apartment|
    print apartment.address
    puts ''
    tenants_in_apartment = all_tenants.select {|tenant| tenant.apartment_id == apartment.id}
    tenants_in_apartment.each {|person| print '  '; puts person.name}
  end
end
