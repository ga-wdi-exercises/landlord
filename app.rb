require "bundler/setup"
require 'pry'
require 'active_record'
require 'pg'

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

#this function adds a new apartment to the db
def add_apt
  apt_hash = Hash.new(0)
  puts "Enter information for your new apartment here.  If you don't know a value press enter to get to the next field.  Type exit or quit to quit."
  puts "Enter an address"
  address = gets.chomp
  if address == "exit" || address == "quit"
    return
  end
  apt_hash[:address]= address unless address == ""
  puts "Enter the monthly rent"
  rent = gets.chomp
  apt_hash[:monthly_rent]= rent unless rent == ""
  puts "Enter the square feet"
  sqft = gets.chomp
  apt_hash[:sqft]= sqft unless sqft == ""
  puts "Enter number of beds"
  num_beds = gets.chomp
  apt_hash[:num_beds]= num_beds unless num_beds == ""
  puts "Enter number of bathrooms"
  num_baths = gets.chomp
  apt_hash[:num_baths]= num_baths unless num_baths == ""
  Apartment.create(apt_hash)
  puts "Apartment added!"
end
#this function deletes an apt from the db
def delete_apt
  puts "Enter the address of the apartment you would like to delete. Type quit or exit to leave. NOTE: deleting an apartment will delete all tenants of that apartment from the system."
  user_input = gets.chomp
  if user_input == "exit" || user_input == "exit"
    return
  else
    apt = Apartment.find_by(address: user_input)
    #check to see if apt address works
    if (apt == nil)
      puts "Invalid address."
      return
    end
    #remove all tenants from that apt
    apt.tenants.delete
    #delete the apt
    apt.delete
    puts "Apartment deleted"
  end
end
#this function holds all the function calls to manage tenants
def manage_tenants
  puts "To add a tenant to the system type add tenant.  To delete a tenant type delete tenant.  To modify an existing tenant, type modify tenant.  Or enter exit or quit."
  user_input = gets.chomp
  if user_input == "quit" || user_input == "exit"
    return
  #calls the three functions to handle tenants based on the user input
  elsif user_input == "add tenant"
    plus_tenant
  elsif user_input == "delete tenant"
    remove_tenant
  elsif user_input == "modify tenant"
    mod_tenant
  end
end
#this function adds a new tenant
def plus_tenant
  puts "Enter information about the new tenant below.  If you don't know a field press enter to get to the next field.  Type exit or quit to leave."
  puts "Name:"
  user_input = gets.chomp
  if user_input == "quit" || user_input == "exit"
    return
  end
  new_tenant = Hash.new(0)
  new_tenant[:name]=user_input unless user_input == ""
  puts "Age:"
  user_input = gets.chomp
  new_tenant[:age]=user_input unless user_input == ""
  puts "Gender:"
  user_input = gets.chomp
  new_tenant[:gender]= user_input unless user_input == ""
  puts "Apartment Address:"
  user_input = gets.chomp
  if Apartment.find_by(address: user_input) != nil
    new_tenant[:apartment_id]= Apartment.find_by(address: user_input).id unless user_input == "null"
  else
    puts "Invalid Apartment input.  Entering a null value.  You may edit this value later."
  end
  Tenant.create(new_tenant)
  puts "Tenant added!"
end
#this function modifies an existing tenant
def mod_tenant
  puts "Enter the name of the tenant you would like to modify.  Or type exit or quit to leave"
  user_input = gets.chomp
  if user_input == "quit" || user_input == "exit"
    return
  end
  #find the tenant to modify, make sure he exists
  mod_tenant = Tenant.find_by(name: user_input)
  if mod_tenant == nil
    puts "Couldn't find that tenant.  You can add a new tenant elsewhere."
    return
  end
  mod_hash = Hash.new(0)
  puts "Enter new values for each field.  Or press enter to leave a field unchanged."
  puts "Name: #{mod_tenant.name}"
  puts "New name:"
  user_input = gets.chomp
  mod_hash[:name] = user_input unless user_input == ""
  puts "Age: #{mod_tenant.age}"
  puts "New age:"
  user_input = gets.chomp
  mod_hash[:age] = user_input unless user_input == ""
  puts "Gender: #{mod_tenant.gender}"
  puts "New gender:"
  user_input = gets.chomp
  mod_hash[:gender] = user_input unless user_input == ""
  puts "Apartment: #{Apartment.find(mod_tenant.apartment_id).address}"
  puts "New apartment (address):"
  user_input = gets.chomp
  mod_hash[:apartment_id] = Apartment.find_by(address: user_input).id unless user_input == ""
  mod_tenant.update(mod_hash)
  puts "Tenant information updated!"
end
#remove a tenant with this function
def remove_tenant
  puts "Enter a tenant name.  Or exit/quit"
  user_input = gets.chomp
  if user_input == "exit" || user_input == "quit"
    return
  end
  bye_tenant = Tenant.find_by(name: user_input)
  #make sure tenant exists
  if bye_tenant == nil
    puts "Couldn't find that tenant.  Feel free to try again."
    return
  end
  bye_tenant.delete
  puts "Tenant Removed!"
end
#this function modifies an apartment
def mod_apt
  puts "Enter the apartment address.  Enter quit or exit to leave"
  user_input = gets.chomp
  if user_input == "exit" || user_input == "quit"
    return
  end
  mod_hash = Hash.new(0)
  mod_apt = Apartment.find_by(address: user_input)
  #checks to see if apartment exists
  if mod_apt == nil
    puts "Couldn't find an apartment with this address."
    return
  end
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
  puts "Apartment updated!"
end
#this function holds all the sub-functions used to manage apartments.
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
#this is the main command line app from which all other functions are called
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

#run the app
run_cmd_app
