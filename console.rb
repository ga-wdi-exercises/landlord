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
#
# binding.pry
#
# puts "ignore this line, it's just here so the binding.pry above works"


# See a list of all apartments (include ID#, address, and monthly rent)
# See a list of all tenants (include name and age)
# See a list of all apartments and their associated tenants (just address and name)

  input = 0
  apartments = Apartment.all
  tenants = Tenant.all
  until input == "4" do
    puts "=" * 50
    puts "Bob Pizza's Gentrifier 0.1a"
    puts "=" * 50
    puts "1) List all apartment units"
    puts "2) List all tenants"
    puts "3) List apartments with tenants"
    puts "4) Exit"
    puts "Please enter your choice:"
    input = gets.chomp
    if input == "1"
      apartments.each do |unit|
        puts "ID-#{unit.id}] @ #{unit.address} for $#{unit.monthly_rent}/mo"
      end
    elsif input == "2"
      tenants.each do |renter|
        puts "#{renter.name}, Age: #{renter.age} in Apt ##{apartment_id}"
      end
    elsif input == "3"
      apartments.each do |unit|
        puts "ID-#{unit.id}] @ #{unit.address} for $#{unit.monthly_rent}/mo"
        puts tenant.where("apartment_id==unit.id")
      end
    else
      puts "Invalid input. Enter valid value."
    end
  end
