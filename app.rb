require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"





######################################################################
# Select Apt
# Description:Display list of all apartments return id
#     Parmeters: none
#
#     Return  - ID of apartment
#######################################################################
def select_apt()
  puts `clear`

  # Select Apartment for Rent change
  # Enter Rent Amount
  # Update Rent
  # Save Changes
end # change_rent

######################################################################
# change Rent()
# Description: Change Rent of exisiting apt
#     Parmeters: none
#
#     Return  - nil
#######################################################################
def change_rent()
  puts `clear`
  puts "Change Rent"
  # Select Apartment for Rent change
  # Enter Rent Amount
  # Update Rent
  # Save Changes
end # change_rent

######################################################################
# add_tenants_to_apt()
# Description: Add Tenants to Apartments
#     Parmeters: none
#
#     Return  - nil
#######################################################################
def  add_tenants_to_apt()
  puts `clear`
  puts "Change Rent"
  # Select Apartment for new Tenant
  # Select Existing Tenant
  # No  -> Add New Tenant
  # Yes -> Move Tenant to Apt
  # Update Tenant Apartment ID
  # Save Changes
end #  add_tenants_to_apt

######################################################################
# Add Evict Tenant()
# Description: view  and optionally select all Tenant report
#     Parmeters: none
#
#     Return  - nil
#######################################################################
def  evict_tenant()
  puts `clear`
  puts "Evict Tenant"

  # Select Tenant to Evict
  # Select Existing Tenant
  # Delete Tenant
  # Save Changes
end # evict Tenant

#######################################################################
# view_all_apts()
# Description: view and optionaly select all apartment report
#     Parmeters: none
#
#     Return  - nil
#######################################################################
def view_all_apts(title,option)
  puts `clear`
  puts title
  puts

  case option
  when :get_apt
    printf("%-8s  %-30s \n","Id","Address")
  when :view_apt
    printf("%4s          %-30s %-7s\n","ID","Address","Rent")
    print
  end # case


  # Iterate over each apartment, for each apartment, display it's address and rent price
  Apartment.find_each do |apt|
    printf( " %-10s  %-30s  $%8.2f\n",apt.id,apt.address,apt.monthly_rent)
  end # do
   puts
end # view all apts

#######################################################################
#   view_all_tenants()
# Description: view all tenants report
#     Parmeters: title - Title to display
#                option 1  - display list only
#                option 2  - display Numbered list and get Selection
#
#     Return  - nil  - Option 1
#              ID of Apartment
#######################################################################
def   view_all_tenants(title,option)
  puts `clear`
  puts title
  puts
  # setup title strings based on options
  case option
  when :get_tenant
    printf("%-8s  %-30s \n","Id","Name")
  when :view_tenant
    printf("%-30s %-8s \n","Name","Age")
    print
  end # case

  Tenant.find_each do |user|
    case option
    when :view_tenant
      printf( "%-30s  %-8d\n",user.name,user.age)
    when :get_tenant
      printf( "%-8d %-30s  \n",user.id,user.name)
    end #case
  end # doTenant
  printf("%s" , "\n\n")
  if option == :get_tenant
    print(" Enter ID of Tenant:")
    return(gets.chomp)
  end

end # view_all_tenants

#######################################################################
#    view_all_apts_and_tenants
# Description: view all tenants report
#     Parmeters: None
#
#     Return  - nil
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
#     Return  - true  - exit  false = replay menu
#######################################################################
def handle_menu(menu_item)
  case menu_item
  when 1
    view_all_apts("View All Apartments",:view_apt)
    puts("Press [ENTER] to continue")
    gets
    return false
  when 2
    view_all_tenants("View All Tenants",:view_tenant)
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
#     Return  - choice number
#######################################################################
def menu
  puts `clear`
  puts "Landlord Management System"
  puts
  puts "1  - View all the apartments"
  puts "2  - View all the tenants"
  puts "3  - View all apartments and their associated tenants"
  puts "4  - Change Rent on Apartment"
  puts "5  - Evict Tenant"
  puts "6  - Add New Tenant"
  puts "8  - Add New Apartment"
  puts "9  - Move a Tenant"
  puts "99 - Exit this App"
  puts
  print "Enter Menu Choice[1..9  99 ]:"
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
