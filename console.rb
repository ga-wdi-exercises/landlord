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

choice = nil
while choice != 'q'

  2.times {puts "*" * 70}
  puts "Welcome to Landlord
        Options:
        1) See all apartments
        2) See all tenants
        3) See all apartments and associated tenants
        4) Look up apartment from tenant name
        q) Exit the program"
  2.times {puts "*" * 70}
  puts ""
  puts "Please enter your selection"

  choice = nil
  while ![1, 2, 3, 4, 'q'].include? choice
    choice = (gets.chomp)
    choice = choice.to_i unless choice == 'q'
  end

  case choice
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
      tenants_in_apartment = apartment.tenants

    end

  when 4
    puts "What is the tenant's name?"
    raw_lookup = gets.chomp
    tenant_lookup = raw_lookup.split.map(&:capitalize).join(' ')
    apt_lookup = nil
    all_tenants = Tenant.all
    this_tenant = all_tenants.find_by(name: tenant_lookup)
    this_apartment = this_tenant.apartment
    puts "#{tenant_lookup} is renting #{this_apartment.address}"
  end
end
