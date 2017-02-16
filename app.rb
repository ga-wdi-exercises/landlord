require 'pry'

  puts "Select an option from the menu: "
  puts "Apt - list of all apartments, "
  puts "Ten - list of all tenants, "
  puts "All - list of tenants and apartments"
  user_input = gets.chomp

valid_choices = ["Apt", "Ten", "All"]
valid_choices.each do |valid|
  index +=1
end

if user_input == valid_choices[0]
  apartments.each do |apt|
    puts "Apartment: #{apt.id}, Address: #{apt.address}, Rent: #{apt.monthly_rent}"
  end
elsif user_input == valid_choices[1]
  tenants.each do |tenant|
    puts "Name: #{tenant.name}, Age: #{tenant.age}"
  end
elsif user_input == valid_choices[2]
  apartments.each do |apt|
    puts "Address: #{apt.address}"
    end
  tenants.each do |tenant|
    puts "Name: #{tenant.name}"
    end
  if apt.apartment_id == tenant.name
    puts "Address: #{apt.address}".join "Name: #{tenant.name}"
  end
else
  puts "no valid option entered"
end
