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
def all_apartments

end

def all_tenants
end
def all_apartments_tenants
end

puts "Welcome to the landlord software 2.0."
x = 0
while x = 0 do
  puts "What would you like to do?"
  puts "     [1] List all apartments"
  puts "     [2] List all tenants"
  puts "     [3] List all apartments with tenants"
  answer = gets.chomp
  case answer
  when 1
    Apartment.all.each do |apartment|
      puts "#{apartment.id} #{apartment.address} #{apartment.monthly_rent}"
    end
  when 2
    Tenant.all.each do |tenant|
      puts "#{tenant.name} #{tenant.age}"
    end
  when 3
    Apartment.all.each do |apartment|
      puts "#{apartment.address} #{Tenant.find_by(apartment_id: apartment.id) ? Tenant.find_by(apartment_id: apartment.id).name : ''}"
    end
  else
    puts "Goodbye"
    x = 1
  end
end

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
