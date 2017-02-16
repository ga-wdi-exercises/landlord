require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

puts "Welcome to Roosevelt Apartments"
puts "Select 1 for a list of all apartments"
puts "Select 2 for a list of all tenants"
puts "Select 3 for a list of all apartments and their tenants"

input = gets.chomp.to_i

while input == 1 || 2 || 3
  if input == 1
    Apartment.each do |apartment|
    puts "#{apartment.address}, #{apartment.monthly_rent}, #{apartment.sqft}, #{apartment.num_beds}, #{apartment.num_baths}"
  end
elsif input == 2
Tenant.each do |tenant|
  puts "#{tenant.name}, #{tenant.age}"
end
elsif input == 3
  #not sure how to complete
    end
  end
end
else
  puts "Invalid entry, please try again."
end

end



binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
