require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"
#
# NOTE: Uncomment the lines below to verify that your seed script is working

# puts "There are #{Apartment.count} apartments"
# puts "There are #{Tenant.count} tenants"
#
# puts "*" * 50
#
# puts "The first apartment is at #{Apartment.first.address}."
# puts "It has  #{Apartment.first.tenants.count} tenants."
def apartments_with_tenants
  Apartment.all.each do |item|
    puts "========= #{item.address} =========================="
    Tenant.all.each do |tenant|
      puts tenant.name if tenant.apartment_id == item.id
    end
  end
end

def all_apartments
  Apartment.all.each { |item| puts "#{item.address} ++++ #{item.monthly_rent}"}
end

def all_tenants
  Tenant.all.each { |item| puts "#{item.name} === #{item.id}" }
end

puts "*" * 50
puts "Type code to see data:"
puts "1 to see all apartments"
puts "2 to see all tenants"
puts "3 to see all apartments with their tenants"
puts "*" * 50
user_response = gets.chomp

all_apartments if user_response == "1"
all_tenants if user_response == "2"
apartments_with_tenants if user_response == "3"



binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
