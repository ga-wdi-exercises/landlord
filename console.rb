require "pry"
require "active_record"
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

def menu
  puts "Choose and option:
  1 - Apartment Listing
  2 - Tenants Log
  3 - Residences
  0 - Exit"
  return gets.chomp.to_i
end

system "clear"

loop do
  choice = menu

  case choice
  when 1
    Apartment.all.each do |apartment|
      puts "#{apartment.id} | #{apartment.monthly_rent} - #{apartment.address}"
    end

  when 2
    Tenant.all.each do |tenant|
      puts "#{tenant.name} | age:#{tenant.age}"
    end

  when 3
    Apartment.all.each do |apartment|
      puts apartment.address
      apt_tens = Tenant.select{|tenant| tenant[:apartment_id] == apartment[:id]}
      apt_tens.each{|tenant| puts tenant.name}
    end
  when 0
    break
  end
end

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
