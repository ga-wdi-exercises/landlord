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

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"

# Step 3 solution 

def menu
  puts "-" * 60
  puts "Choose an option:
  1) List all apartments
  2) List all tenants
  3) list all apartments and their associated tenants
  q) Quit"
  puts "-" * 60
  return gets.chomp
end

system "clear"

loop do
  choice = menu

  case choice
  when "1"
    system "clear"

    Apartment.all.each do |apartment|
      puts "#{apartment.id} | $#{apartment.monthly_rent} - #{apartment.address}"
    end

  when "2"
    system "clear"

    Tenant.all.each do |tenant|
      puts "#{tenant.name} | age: #{tenant.age}"
    end

  when "3"
    system "clear"

    Apartment.all.each do |apartment|
      puts "-" * 30
      puts apartment.address
      apartment.tenants.each do |tenant|
        puts tenant.name
      end
    end

  when "q"
    break
  end
end
