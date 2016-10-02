require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"


#######################################################################
# view_all_apts()
# Description: view all apartment report
#     Parmeters: none
#
#     Return - nil
#######################################################################
def view_all_apts()
  puts `clear`
  puts "View All Apartments"
  puts
  printf(" %-10s  %-30s  %-7s \n","ID","Address","Rent")

  # Iterate over each apartment, for each apartment, display it's address and rent price
  Apartment.find_each do |apt|
    printf( " %-10s  %-30s  $%8.2f\n",apt.id,apt.address,apt.monthly_rent)
  end # do
   puts
end # view all apts

#######################################################################
#   view_all_tenants()
# Description: view all tenants report
#     Parmeters: None
#
#     Return - nil
#######################################################################
def   view_all_tenants()
  puts `clear`
  puts "View All Tenants"
  puts
  printf("%-30s  %-8s \n","Name","Age")
  Tenant.find_each do |user|
    printf( " %-30s  %8d\n",user.name,user.age)
  end #Tenant
  printf("%s" , "\n\n")
end # view_all_tenants

#######################################################################
#    view_all_apts_and_tenants
# Description: view all tenants report
#     Parmeters: None
#
#     Return - nil
#######################################################################
def    view_all_apts_and_tenants()
  puts `clear`
  puts "View all apartments and their associated tenants"
  puts

  Apartment.includes(:tenants).find_each { |apartment|
    address_printed = false
    apartment.tenants.each { |tenant|
      # print tenant details
      printf "\n%s\n", "Address: #{apartment.address}" if !address_printed
      printf "%s \n","Tennant: #{tenant.name}"
      address_printed=true
    }
  }
end # view_all_apts_and_tenants(

#######################################################################
# handle_menu
# Description: handle menu number choices
#     Parmeters: menu_itm
#
#     Return - true - exit  false = replay menu
#######################################################################
def handle_menu(menu_item)
  case menu_item
  when 1
    view_all_apts
    puts("Press [ENTER] to continue")
    gets
    return false
  when 2
    view_all_tenants
    puts("Press [ENTER] to continue")
    gets
    return false
  when 3
    view_all_apts_and_tenants
    puts("Press [ENTER] to continue")
    gets
    return false
  when 99
    return true
  else
    puts("Please type a Valid Menu Item")
    puts("Press [ENTER] to continue")
    gets
    return false
  end #case
end # handle_menu

#######################################################################
# menu
# Description: Display Menu of numeric choices
#     Parmeters:  None
#
#     Return - choice number
#######################################################################
def menu
  puts `clear`
  puts "Landlord Management System"
  puts
  puts "1 - View all the apartments"
  puts "2 - View all the tenants"
  puts "3 - View all apartments and their associated tenants"
  puts "99 - Exit this App"
  puts
  print "Enter Menu Choice[1..2  99 ]:"
  return gets.chomp.to_i
end # menu

menu_item=0
while true
  menu_item=menu
  # puts menu_item
  if handle_menu(menu_item)
    break # exit given
  end #if
end
