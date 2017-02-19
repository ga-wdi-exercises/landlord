require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

#
#
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

puts "
          Welcome to Tenant / Apartment Management System
          Input following commands to proceed
          "
      userInput=nil


      userInput = 'menu'
              while !(userInput==nil)
                case userInput
                when "1"
                   Apartment.all.each {|ap| puts "Property:# #{ap.id}; Located at: #{ap.address}"}
                   userInput = gets.chomp
                when "2"
                   Tenant.all.each {|t| puts "Tenant ID: #{t.id}; Tenant Name: #{t.name};"}
                   puts "You are back to the top menu, 'menu' for options, 'exit' to exit"
                   userInput = gets.chomp
                when "3"
                   Apartment.all.each do |ap|
                     puts "The following people live in apartment number #{ap.id}."
                     Tenant.all.each do |t|
                       if t.apartment_id == ap.id
                         puts t.name
                       end
                     end
                    # Tenant.all.each_index.select{|i| Tenant.all[i].apartment_id == ap.id}.each {|t| puts Tenant.all[t].name}
                     puts "------------------------"
                   end
                   puts "You are back to the top menu, 'menu' for options, 'exit' to exit"
                   userInput = gets.chomp
                when "4"
                  Tenant.all.each {|t| puts "Tenant ID: #{t.id}; Tenant Name:'#{t.name}';"}
                  puts "Enter tenant 'id' to search for tenant address"
                  userInput = gets.chomp
                    apartment_id = nil
                    apartment_id = Tenant.all.find{|ap| ap.id == userInput.to_i}.apartment_id
                    puts "Tenants address: #{Apartment.all.find{|ap| ap.id == apartment_id}.address}"
                  puts "You are back to the top menu, 'menu' for options, 'exit' to exit"
                  userInput = gets.chomp
                when "5"
                  tenantManipulator=[];
                  # Print list of apartments with IDs and Addresses
                  Apartment.all.each {|ap| puts "Apartment ID: #{ap.id}; Apartment Address:#{ap.address};"}
                  # User inputs apartment selection
                  puts "Enter apartment 'id' to search for apartment occupancy list"
                  userInput = gets.chomp
                  #Output apartment's occupants list
                    Tenant.all.each do |t|
                      if t.apartment_id == userInput.to_i
                        puts t.name
                      end
                    end
                  puts "You are back to the top menu, 'menu' for options, 'exit' to exit"
                  userInput = gets.chomp

                when "exit"
                    puts " Beep Boop Boop Goodbye  [0_0] [o_o] [*_*] [-_-] zzz "
                    break
                when "menu"
                    puts "
                          '1' - View all apartments
                          '2' - View all tenants
                          '3' - View all the apartments with their tenant occupants
                          '4' - Search tenant name to get tenant address
                          '5' - Get apartment's occupancy list

                          'menu' - for menu
                          'exit' - to exit
                          "
                    userInput = gets.chomp
                else
                    puts "What do you mean? Pick a number, 'menu' for list of options, 'exit' to exit ! ;)"
                    userInput = gets.chomp
                    next
                  end
              end
