require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# NOTE: Uncomment the lines below to verify that your seed script is working

puts "There are #{Apartment.count} apartments"
puts "There are #{Tenant.count} tenants"

puts "*" * 50

puts "The first apartment is at #{Apartment.first.address}."
puts "It has  #{Apartment.first.tenants.count} tenants."


#if you want me to run with just the cli and not the pry please comment out "binding.pry"
    @apartments = Apartment.all
    @tenants = Tenant.all
puts "Choose a category"
        puts "1 for list of all apartments"
        puts "2 list of all tenants"
        puts "3 for list of all apartments and their associated tenants"
       input = gets.chomp

       if["1", "2", "3"].include? input
               puts "you choose #{input}"
       end


               if input == "1"
                 puts "There are #{@apartments.count} apartments"
                  @apartments.each do |apartment|
                  puts "apartment id : #{apartment.id} - monthly rent: $#{apartment.monthly_rent} - address: #{apartment.address}"

               end

               elsif input == "2"
                 puts "There are #{@tenants.count} tenants"
                 puts "They are trying to grow old together,hence the same age"
                 @tenants.each do |tenant|
               puts "tenant name: #{tenant.name} - tenant age: #{tenant.age}"

               end

             elsif input == "3"
                @apartments.each do |apartment|
                 puts "the tenants that reside at this apartment: #{apartment.address} "
            tenants_at_this = @tenants.select{|tenant| tenant[:apartment_id] == apartment[:id]}
            tenants_at_this.each{|tenant| puts tenant.name}

               end

             else
               puts "Please enter from the choices"

             end



binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
