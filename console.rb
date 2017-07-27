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

# 1. See a list of all apartments (include ID#, address, and monthly rent)
# 2. See a list of all tenants (include name and age)
# 3. See a list of all apartments and their associated tenants (just address and name)

puts "Greetings MR PIZZA,"
puts "please enter 1 for apartment list, "
puts "2 for tenant list, "
puts "3 to view apartments with associated tenants, "
puts "4 to adjust rent"
puts "5 to evict tenant"
puts "6 to create propery record"
puts "7 to create tenant record"
puts "8 to exit"
input = gets.chomp
while true do
Apartment.find_each do |apart|
  if input == "1"
    puts "ID: #{apart.id}, address: #{apart.address}, price: #{apart.monthly_rent}"
  end
end
Tenant.find_each do |tenant|
  if input == "2"
    puts "Id: #{tenant.id}, name: #{tenant.name}, age: #{tenant.age}"
  end
end
Apartment.find_each do |a|
  if input == "3"
    puts "address: #{a.address}"
    puts '*' * 50
      a.tenants.each do |tenants|
        puts tenants.name
      end
    puts "-" * 50
  end
end
if input == "4"
  puts "which apartment would you like to adjust rent for? enter ID #:"
  num = gets.chomp
  k = Apartment.find(num)
  puts "enter new rent amount:"
  new_rent = gets.chomp
  k.monthly_rent = new_rent
  k.save
  puts "#{k.address}, new rent: #{k.monthly_rent}"
end
if input == "5"
  puts "which tenant would you like to evict?"
  puts "WARNING: this is permanent"
  evict_tenant = gets.chomp
  j = Tenant.find(evict_tenant)
  j.destroy
  puts "tenant evicted"
  puts "press 2 to view updated list"
end
if input == "6"
  puts "welcome to the property creation tool"
  puts "please follow the prompts and be mindful of spelling / capitalization"
  puts "enter propery address:"
  new_address = gets.chomp
  puts "enter monthly rent:"
  new_rent = gets.chomp.to_i
  puts "enter square feet"
  new_sqft = gets.chomp.to_i
  puts "enter number of beds:"
  new_beds = gets.chomp.to_i
  puts "enter number of baths"
  new_baths = gets.chomp.to_i
  # {address:"123 barber st", monthly_rent: 900, sqft: 3000, num_beds: 3, num_baths: 2},
  r = Apartment.new(address: new_address, monthly_rent: new_rent, sqft: new_sqft, num_beds: new_beds, num_baths: new_baths)
  puts "press 1 to save, 2 to cancel"
  apart_save = gets.chomp
  if apart_save == "1"
    r.save
    puts "SUCCESS! press 1 for updated list"
  elsif apart_save == "2"
    puts "apartment not saved"
  end
end
if input == "7"
  puts "welcome to the tenant creation tool"
  puts "please follow the prompts and be mindful of spelling / capitalization"
  puts "enter tenant name:"
  new_name = gets.chomp
  puts "enter tenant age:"
  new_age = gets.chomp.to_i
  puts "enter tenant gender:"
  new_gender = gets.chomp
  puts "enter apartment id#:"
  new_id = gets.chomp.to_i
  new_tenant = Tenant.new(name: new_name, age: new_age, gender: new_gender, apartment_id: new_id)
  puts "press 1 to save, 2 to cancel"
  save = gets.chomp
    if save == "1"
      new_tenant.save
      puts "SUCCESS! press 2 for updated list"
    elsif save == "2"
      puts "tenant not saved"
    end
  # {name:"Jacob Greenwald", age: 28, gender: 'Male', apartment_id: 52},
end
if input == "8"
  break
end
input = gets.chomp
end

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
