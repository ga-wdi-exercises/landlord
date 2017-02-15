require_relative 'db/connection' # let app.rb connect with postgres database "landlord" (also comes with pg, activerecord, and pry)
require_relative 'models/apartment' # let app.rb access the Apartment class defined in models
require_relative 'models/tenant' # let app.rb access the Tenant class defined in models

puts "What would you like to do?"
puts "(1) See a list of all apartments (including ID#, address, and monthly rent)."
puts "(2) See a list of all tenants (include name and age)."
puts "(3) See a list of all apartments and their associated tenants (just address and name)."

option = gets.chomp

if option == "1"
  all_apartments = Apartment.all
  all_apartments.each do |apt|
    puts ' '
    puts '=' * 20
    puts "ID#: #{apt.id}"
    puts "Address: #{apt.address}"
    puts "Montly rent: #{apt.monthly_rent}"
    puts '=' * 20
    puts ' '
  end
elsif option == "2"
  all_tenants = Tenant.all
  all_tenants.each do |tenant|
    puts ' '
    puts '=' * 20
    puts "Name: #{tenant.name}"
    puts "Age: #{tenant.age}"
    puts '=' * 20
    puts ' '
  end
elsif option == "3"
  Apartment.all.each do |apt|
    puts ' '
    puts '=' * 20
    puts "Address: #{apt.address}"
    tenants = apt.tenants
    tenants.each do |tenant|
      puts ' ' + tenant.name
    end
    puts '=' * 20
    puts ' '
  end
end
