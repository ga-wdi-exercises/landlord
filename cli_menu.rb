require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

class Menu
  def self.display
    while true
      puts "Enter 1 to view all apartments"
      puts "Enter 2 to view all tenants"
      puts "Enter 3 to view apartments with tenants"
      input = gets.chomp
      if input == '1'
        Apartment.all.each do |apartment|
          puts "Address: #{apartment.address}, Rent: $#{apartment.monthly_rent}, Sqft: #{apartment.sqft}, Beds: #{apartment.num_beds}, Baths: #{apartment.num_baths}"
        end
      elsif input == '2'
        Tenant.all.each do |tenant|
          puts "Name: #{tenant.name}, Age: #{tenant.age}, Gender: #{tenant.gender}"
        end
      elsif input == '3'
        Apartment.all.each do |apartment|
          if apartment.tenants.count > 0
            puts "Apartment: #{apartment.address}"
            apartment.tenants.each do |tenant|
              puts "Tenant: #{tenant.name}"
            end
          end
        end
      end
    end
  end
end

Menu.display
