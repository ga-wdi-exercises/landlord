# require "pg" # postgres db library
# require "active_record" # the ORM
# require "pry" # for debugging
#
# require_relative "db/connection"
# require_relative "models/apartment"
# require_relative "models/tenant"
#



# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."
#
# binding.pry
puts "*" * 50


  puts "Please pick an option:"
  puts "type '1' view all apartments;
  type '2' view all tenants
  type '3' view all tenants at each apartment"
  option = gets.chomp

  while option != "1" && option !="2"  && option !='3' && option !='4' do
    puts "type '1' view all apartments;
    type '2' view all tenants
    type '3' view all tenants at each apartment"
    option = gets.chomp
    puts option
  end

  # option1 all apartments to include id/address/monthly_rent
 if option == "1"
   Apartment.find_each do |apartment|
     puts " Apartment id: #{apartment.id}; address: #{apartment.address}; rent: #{apartment.monthly_rent}"
   end

  # option2 all tenants to include name/age
elsif option == "2"
  Tenant.find_each do |tenant|
    puts "Tenant name: #{tenant.name}; age: #{tenant.age}"
 end
 #
 # # option3 all apts and tenants/address/name
elsif option == "3"
  Apartment.find_each do |apartment|
    puts "Apartment Address: #{apartment.address}"
    apartment.tenants.find_each do |tenant|
    puts "tenant: #{tenant.name}"
  end
 end


end
