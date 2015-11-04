require "bundler/setup"
require 'pry'
require 'active_record'
require 'pg'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

def add_apt
  apt_hash = Hash.new(0)
  puts "Enter information for your new apartment here.  If you don't know a value enter null.  Type exit or quit to quit."
  puts "Enter an address"
  address = gets.chomp
  if address == "exit" || address == "quit"
    return
  end
  apt_hash[:address]= address unless address == "null"
  puts "Enter the monthly rent"
  rent = gets.chomp
  apt_hash[:monthly_rent]= rent unless rent == "null"
  puts "Enter the square feet"
  sqft = gets.chomp
  apt_hash[:sqft]= sqft unless sqft == "null"
  puts "Enter number of beds"
  num_beds = gets.chomp
  apt_hash[:num_beds]= num_beds unless num_beds == "null"
  puts "Enter number of bathrooms"
  num_baths = gets.chomp
  apt_hash[:num_baths]= num_baths unless num_baths == "null"
  Apartment.create(apt_hash)
end
def delete_apt
  puts "Enter the address of the apartment you would like to delete. Type quit or exit to leave. NOTE: deleting an apartment will delete all tenants of that apartment from the system."
  user_input = gets.chomp
  if user_input == "exit" || user_input == "exit"
    return
  else
    apt = Apartment.find_by(address: user_input)
    apt.tenants.delete
    apt.delete
  end
end
def manage_tenants
  puts "To add a tenant to the system type add tenant.  To delete a tenant type delete tenant.  To modify an existing tenant, type modify tenant.  Or enter exit or quit."
  user_input = gets.chomp
  if user_input == "quit" || user_input == "exit"
    return
  elsif user_input == "add tenant"
    plus_tenant
  elsif user_input == "delete tenant"
    remove_tenant
  elsif user_input == "modify tenant"
    mod_tenant
  end
end
def plus_tenant
  puts "Enter information about the new tenant below.  Enter null as a placeholder field.  Type exit or quit to leave."
  puts "Name:"
  user_input = gets.chomp
  if user_input == "quit" || user_input == "exit"
    return
  end
  new_tenant = Hash.new(0)
  new_tenant[:name]=user_input unless user_input == "null"
  puts "Age:"
  user_input = gets.chomp
  new_tenant[:age]=user_input unless user_input == "null"
  puts "Gender:"
  user_input = gets.chomp
  new_tenant[:gender]= user_input unless user_input == "null"
  puts "Apartment Address:"
  user_input = gets.chomp
  new_tenant[:apartment_id]= Apartment.find_by(address: user_input).id unless user_input == "null"
  puts new_tenant
  Tenant.create(new_tenant)
end
def mod_tenant

end
def remove_tenant

end
def mod_apt
  puts "Enter the apartment address.  Enter quit or exit to leave"
  user_input = gets.chomp
  if user_input == "exit" || user_input == "quit"
    return
  end
  mod_hash = Hash.new(0)
  mod_apt = Apartment.find_by(address: user_input)
  puts "Enter a new value for each attribute.  If you don't want to modify a certain attribute, enter null"
  puts "Adress:"
  user_input = gets.chomp
  mod_hash[:address] = user_input unless user_input == null
  puts "Rent:"
  user_input = gets.chomp
  mod_hash[:monthly_rent] = user_input unless user_input == null
  puts "Square feet:"
  user_input = gets.chomp
  mod_hash[:sqft] = user_input unless user_input == null
  puts "Number of beds:"
  user_input = gets.chomp
  mod_hash[:num_beds] = user_input unless user_input == null
  puts "Number of bathrooms:"
  user_input = gets.chomp
  mod_hash[:num_baths] = user_input unless user_input == null
  mod_apt.update(mod_hash)
end
def manage_apts
  loop do
    puts "To add a new apartment, type new apt.  To delete an apartment type delete apt.  To edit exiting apartments, type modify apt. To leave, type exit or quit."
    user_input = gets.chomp
    if user_input == "exit" || user_input == "quit"
      break
    elsif user_input == "new apt"
      add_apt
      next
    elsif user_input == "delete apt"
      delete_apt
      next
    elsif user_input == "modify apt"
      mod_apt
      next
    else
      puts "Your input was invalid.  Try again or exit."
      next
    end
  end
end
def run_cmd_app
  loop do
    puts "Enter quit or exit to leave.  Enter apts or apartments to manage apartments.  Enter ten or tenants to manage tenants."
    user_input = gets.chomp
    if user_input == "quit" || user_input == "exit"
      break
    elsif user_input == "apts" || user_input == "apartments"
      manage_apts
      next
    elsif user_input == "ten" || user_input == "tenants"
      manage_tenants
      next
    else
      puts "Your input was invalid."
      next
    end
  end
end

binding.pry
