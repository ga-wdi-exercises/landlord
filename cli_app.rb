require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

in_use = true

while in_use do
  puts '**Slum Management**'
  puts 'What do you want to do:'
  puts '[1] See all apartments'
  puts '[2] See all tenants'
  puts '[3] See all apartments with their tenants'
  puts 'press any other key to exit'
  answer = gets.chomp
  if answer == '1'
    puts '**All Apartments**'
    apartments = Apartment.all
    apartments.each{|apt| puts "- Id: #{apt.id}, Address: #{apt.address}, Rent: $#{apt.monthly_rent}, Sq Feet: #{apt.sqft}, Bedrooms: #{apt.num_beds}, Bathrooms: #{apt.num_baths}"}
    puts '******************'
  elsif answer == '2'
    puts '**All Tenants**'
    tenants = Tenant.all
    tenants.each{|t| puts "Name: #{t.name}, Age: #{t.age}, Gender: #{t.gender}"}
    puts '***************'
  elsif answer == '3'
    puts '**All Apartments and Tenants**'
    apartments = Apartment.all
    apartments.each do |x|
      tenants = []
      x.tenants.each{|y| tenants << y.name}
      puts "#{x.address}, tenants: #{tenants.join(", ")}"
    end
    puts '******************************'
  else
    in_use = false
    break
  end
end
