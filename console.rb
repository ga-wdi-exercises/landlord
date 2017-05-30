require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"

# puts "*" * 50

# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."


class Landlord
	def initialize()
		
	end
	def display
    	while 1
      	puts ""
      	puts "1 to display apartments"
      	puts "2 to display tenants"
      	puts "3 to display apartments with tenants"
      	puts "exit to quit"
      	input = gets.chomp!
        	if ["1","2","3","4","exit"].include? input
        	  menu_selection input
        	  break
        	else
        	  puts "Invalid option."
        	end
    	end
  	end
  	def menu_selection input
  		case input
  		when "1"
  			display_all_apts
  			gets
  			display
  		when "2"
  			display_all_tenants
  			gets
  			display
  		when "3"
  			display_apt_with_tenants
  			gets
  			display
  		when "exit"
  			return
  		end
  	end

  	def display_all_tenants
  		Tenant.all.each do |x|
  			puts " \n #{x.name}, #{x.age}, resides at apt# #{x.apartment_id}"
  		end
  		puts ""
  		puts "press enter to return to menu"
  	end

  	def display_all_apts
  		Apartment.all.each do |apt|
  			puts "#{apt.address}, $#{apt.monthly_rent}, apt-id: #{apt.id}"
  		end
  		puts ""
  		puts "press enter to return to menu"
  	end

  	def display_apt_with_tenants
  		Apartment.all.each do |apt|
  			puts " \n #{apt.address}"
  			Tenant.all.each do |person|
	  			if apt.id == person.apartment_id
	  				puts "#{person.name}"
	  			else
	  			end
	  		end
  		end
  		puts ""
  		puts "press enter to return to menu"
  	end
end
landlord = Landlord.new
landlord.display

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"







