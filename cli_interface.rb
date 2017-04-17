require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

def show_apartment_detail
  while true
    puts "Choose from the following options
    \n1. See a list of all apartments
    \n2. See a list of all tenants
    \n3. See a list of all partments and their associated tenants
    \n4. End"

    user = gets.chomp

    case user
    when "1"
      Apartment.find_each do |apartment|
        puts "APT id:#{apartment.id}\nAPT address:#{apartment.address}\nATP rent:#{apartment.monthly_rent}"
      end
    when "2"
      Tenant.find_each do |tenant|
        puts "Name:#{tenant.name}\nAge: #{tenant.age}"
      end
    when "3"
      Apartment.find_each do |apartment|
        puts apartment.address
        Tenant.find_each do |tenant|
          if apartment.id == tenant.apartment_id
            puts tenant.name
          end
        end
      end
     when "4"
       break
    end
  end
end

show_apartment_detail







  # See a list of all apartments and their associated tenants (just address and name)
