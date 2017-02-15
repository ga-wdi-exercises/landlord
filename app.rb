require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

br = "*" *60 +"\n"
$all_tenants = Tenant.all
$all_apartments = Apartment.all

while true
  puts "#{br} Welcome to Landlord., you have the following options: "
  puts "  1. View all apartments\n  2. View all tenants\n  3. View tenants by apartments\n  4. Find tenant by name\n  5. Make changes \n (Select an option by entering the corresponding number)\n#{br}"

  user_input = gets.chomp
    if user_input == "1"
      $all_apartments.each {|a| puts "Apartment: #{a.id}  Address: #{a.address}  Rent: #{a.monthly_rent}"}
    elsif user_input == "2"
      $all_tenants.each  do |tenant|
        puts "Tenant: #{tenant.name} Age: #{tenant.age}"
      end
    elsif user_input == "3"
      $all_apartments.each do |apartment|
        puts "#{br}  APARTMENT #{apartment.id}  #{apartment.address}\n#{br}"
        tenants_by_id = $all_tenants.select{|tenant| tenant.apartment_id == apartment.id}
        puts "  TENANTS:\n"
        tenants_by_id.each {|t| puts t.name}
      end
    elsif user_input == "4"
      puts "Enter a name:"
      tenant_name = gets.chomp.downcase
      $all_tenants.each do |tenant|
        if tenant.name.downcase.include? tenant_name
          puts tenant.inspect
        end
      end
    elsif user_input == "5"
      puts "Sorry, this functionality is still in alpha testing"
    end
  end


binding.pry
puts "is there actually a bug in pry?"
