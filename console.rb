require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

puts "There are #{Apartment.count} apartments"
puts "There are #{Tenant.count} tenants"

puts "*" * 50

puts "The first apartment is at #{Apartment.first.address}."
puts "It has  #{Apartment.first.tenants.count} tenants."

# I had this and then I got stuck, so I peaked at the answers.
# puts "Type 1 to view all your apartments."
# puts "Type 2 to view all your tenants."
# puts "Type 3 to view all apartments and their associated tenants."
# user_input = gets.chomp.to_i
# if user_input == 1
# 	puts "Here are all your aparments"
#   	puts Apartment.all
# elsif user_input == 2
#   	puts "Here are all your tenants: "
# 	puts Tenant.all
# end

def menu
	puts "Type 1 to view all your apartments."
	puts "Type 2 to view all your tenants."
	puts "Type 3 to view all apartments and their associated tenants."
	# puts "Type quit to quit."
	return gets.chomp.to_i
end

loop do
	user_input = menu

	if user_input == 1
	puts "Here are all your apartments:"
	Apartment.all.each do |apartment|
		puts "ID: #{apartment.id}, Address: #{apartment.address}, Rent: $#{apartment.monthly_rent}."
 		end
	elsif user_input == 2
  	puts "Here are all your tenants: "
	Tenant.all.each do |tenant|
		puts "Name: #{tenant.name}, Age: #{tenant.age}."
		end
	elsif user_input == 3
	puts "Here are all your apartments and their associated tenants:"
	Apartment.all.each do |apartment|
		puts "Address: #{apartment.address}"
		apartment.tenants.each do |tenant|
			puts "Tenants: #{tenant.name}"
		end
	end
end
#quit option won't work
break if user_input == "quit" 

end
binding.pry


puts "ignore this line, it's just here so the binding.pry above works"
