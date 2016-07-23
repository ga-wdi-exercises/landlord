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

#defining different views
def address_rent_view
  Apartment.all.each do |apartment|
    puts "Id: #{apartment.id}, Address: #{apartment.address}, Monthly Rent: $#{apartment.monthly_rent}"
  end
end

def tenant_view
  Tenant.all.each do |tenant|
    puts "Name: #{tenant.name}, Age: #{tenant.age} years old"
  end
end

def apartment_tenant_view
  Apartment.all.each do |apartment|
    tenant_name = Apartment.find(apartment.id).tenants.pluck(:name)
    if tenant_name == []
      puts "Address: #{apartment.address}"
    else
      puts "Address: #{apartment.address}, Tenants: #{tenant_name.join(", ")}"
    end
  end
end

def add_tenant
  puts "What's the tenant's name?"
  name_input = gets.chomp
  puts "What's the tenant's age?"
  age_input = gets.chomp
  puts "What's the tenant's gender?"
  gender_input = gets.chomp
  puts "What's the apartment id?"
  apt_id_input = gets.chomp
  Tenant.create(name: name_input, age: age_input, gender: gender_input, apartment_id: apt_id_input)
  puts "A new tenant was added to the database!"
end

def assign_apt
  puts "What's the tenant's name you want to assign to a new apartment?"
  name_input = gets.chomp
  puts "What apartment do you want to reassign them to?"
  apt_id_input = gets.chomp
  tenant_to_update = Tenant.find_by(name: name_input)
  tenant_to_update.update(apartment_id: apt_id_input)
  puts "#{name_input} has been assigned to apartment no. #{apt_id_input}."
end

def evict_tenant
  puts "What's the tenant's name you want to evict?"
  name_input = gets.chomp
  tenant_to_evict = Tenant.find_by(name: name_input)
  tenant_to_evict.destroy
  puts "Oh snap, you just evicted #{name_input}!"
end

def raise_rent
  puts "What apartment no. do you want to increase the rent for?"
  apartment_id_input = gets.chomp
  puts "What do you want to the rent to be?"
  rent_input = gets.chomp
  apt_to_update = Apartment.find_by(id: apartment_id_input)
  apt_to_update.update(monthly_rent: rent_input)
  puts "Apartment no. #{apartment_id_input} had its rent increased to $#{rent_input}."
end

# start game
def landlord_game
  loop do
    puts "\nMenu:\n[1] See All Apartments\n[2] See All Tenants\n[3] See All Apts and Tenants\n[4] Add Tenant\n[5] Assign Apartment\n[6] Evict Tenants\n[7] Raise Rent\n[exit]"
    input = gets.chomp
    command, *params = input.split /\s/

    case command
    when /\A1\z/i
      address_rent_view
    when /\A2\z/i
      tenant_view
    when /\A3\z/i
      apartment_tenant_view
    when /\A4\z/i
      add_tenant
    when /\A5\z/i
      assign_apt
    when /\A6\z/i
      evict_tenant
    when /\A7\z/i
      raise_rent
    when /\Aexit\z/i
      puts "Thanks for playin'!"
      break
    else puts "Sorry, that wasn't a good command!"
    end
  end
end

puts "Welcome to the Landlord game! View your minions and properties now!"
# pause game for 1s before loading menu options
sleep(1)
landlord_game

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
