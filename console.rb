require "active_record"
require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

puts "There are #{Apts.count} apartments"
puts "There are #{Tenant.count} tenants"

puts "*" * 50

puts "The first apartment is at #{Apts.first.address}."
puts "It has  #{Apts.first.tenants.count} tenants."

def menu
  puts "Choose an option:"
  1 - Apartments
  2 - Tenants
  3 - Residences
  0 - Exit
  return gets.chomp.to_i
end

system "clear"

loop do
  choice = menu

  # case choice
  when 1
    Apts.all.each do |apt|
      puts "#{{apts.id}} | #{{apts.monthly_rent}} - #{{apts.address}}"
end

  when 2
    Tenant.all.each do |tenant|
      puts "#{tenants.name} | age: #{tenant.age}"
    end

  when 3
    Apts.all.each do |apt|
      puts apts.address
      apt_tenants = Tenant.select{|tenant| tenant[:apts_id] == apts[:id]}
      apt_tenants.each{|tenant| puts tenant.name}
end

  when 0
    break
  end
end






binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
