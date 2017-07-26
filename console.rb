require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

open = true

while open do
  puts "-------------------------\nWelcome to the Landlord App\nSelect a number below to see more data\n\n1. See all apartments\n2. See all tenants\n3. See all apartments with their tenants\n4. EXIT"
  answer = gets.chomp
  if answer == "1"
    puts "------APARTMENTS------"
    apartments = Apartment.all
    apartments.each do |apt|
      puts "ID: #{apt.id}, ADDRESS: #{apt.address}, RENT: $#{apt.monthly_rent}"
    end
  elsif answer == "2"
    puts "------TENANTS------"
    tenants = Tenant.all
    tenants.each do |t|
      puts "NAME: #{t.name}, AGE: #{t.age}"
    end
  elsif answer == "3"
    apartments = Apartment.all
    apartments.each do |apt|
      tenants = []
      apt.tenants.each do |ten|
        tenants << ten.name
      end
      if tenants.length >=1
        puts "Apartment \##{apt.id} at #{apt.address} is occupied by:\n #{tenants.join(", ")}\n\n"
      else
        puts "!!!! Apartment \##{apt.id} at #{apt.address} is VACANT !!!!\n\n"
    end
end
  elsif answer == "4"
    open = false
  else
    puts "Unrecognized command"
    break
  end
end
