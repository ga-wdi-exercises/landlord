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

#defining different views
def address_rent_view
  Apartment.all.each do |apartment|
    puts "Id: #{apartment.id}, Address: #{apartment.address}, Monthly Rent: $#{apartment.monthly_rent}"
  end
end

def tenant_view
  Tenant.all.each do |tenant|
    puts "Name: #{tenant.name}, Age: #{tenant.age} years old"
  end
end

# def apartment_tenant_view
#   Tenant.all.each_with_index do |tenant|
#     tenant_apt << ({
#       name: name,
#       apartment_id: apt,
#       id: index
#   })
#   end
#   puts tenant_apt
# end


# start game
def landlord_game
  loop do
    puts "\nMenu:\n[1] See All Apartments\n[2] See All Tenants\n[3] See All Apts and Tenants\n[exit]"
    input = gets.chomp
    command, *params = input.split /\s/

    case command
    when /\A1\z/i
      address_rent_view
    when /\A2\z/i
      tenant_view
    when /\A3\z/i
      apartment_tenant_view
    when /\Aexit\z/i
      puts "Thanks for playin'!"
      break
    else puts "Sorry, that wasn't a good command!"
    end
  end
end

puts "Welcome to the Landlord game! View your minions and properties now!"
# pause game for 1s before loading menu options
sleep(1)
landlord_game

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
