require 'active_record'

require_relative 'db/connection'
require_relative 'models/apartment'
require_relative 'models/tenant'

# Step 4 - Build out the CLI Interface

# Build out a simple command line interface that provides a menu prompt and allows the user to:

# See a list of all apartments (include ID#, address, and monthly rent)
def list_apartments
  printf "%-10s %-30s %s\n", "ID#", "ADDRESS", "RENT"
  puts "---------------------------------------------"
  Apartment.all.each { |apt|
    printf "%-10d %-30s %d\n", apt.id, apt.address, apt.monthly_rent
  }
end
# See a list of all tenants (include name and age)
def list_tenants
  printf "%-30s %s\n", "Name", "Age"
  puts "---------------------------------------------"

  Tenant.all.each { |tenant|
    printf "%-30s %d\n", tenant.name, tenant.age
  }

end

# See a list of all apartments and their associated
# tenants (just address and name)
def list_associated_tenants
  printf "%-30s %s\n", "Address", "Tenants"
  puts "---------------------------------------------"

  Apartment.all.each { |apt|
    tenants = []
    apt.tenants.each { |tenant|
      tenants << tenant.name
    }
    printf "%-30s %s\n", apt.address, tenants.join(', ')
  }
end
menu = "******************* MENU ********************\n" +
       "[1] See all apartments\n" +
       "[2] See all tenants\n" +
       "[3] See all addresses and associated tenants\n" +
       "*********************************************\n"

flag = 'n'


while flag != 'y'
  puts menu
  input = gets.chomp.to_i
  if input == 1
    list_apartments
  elsif input == 2
    list_tenants
  elsif input == 3
    list_associated_tenants
  else
    print "That is not an option. "
  end

  print "Exit? [y/n]\n"
  flag = gets.chomp
end
