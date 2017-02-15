require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

quit = false

while quit == false
  option = 0
  puts 'What do you want to do?'
  puts '1. List all apartments.'
  puts '2. List all tenants.'
  puts '3. List all apartments w/associated tenants.'
  option = gets.chomp

  while option.to_i == 1
    apartments = Apartment.all
    apartments.each do |apr|
      puts "#{apr.address}"
      puts "#{apr.id}"
      puts "#{apr.monthly_rent}"
    end
    option = 0
  end

  while option.to_i == 2
    tenants = Tenant.all
    tenants.each do |ten|
      puts "#{ten.name}"
      puts "#{ten.age}"
    end
    option = 0
  end

  while option.to_i == 3
    apartments = Apartment.all
    tenants = Tenant.all
    apartments.each do |apr|
      puts "#{apr.address}"
      puts "#{apr.id}"
      puts "#{apr.monthly_rent}"
      tenants.each do |ten|
        if apr.id.to_i == ten.apartment_id.to_i
          puts "#{ten.name}"
          puts "#{ten.age}"
        end
      end
    end
    option = 0
  end

  puts 'want to quit? (y/n)'
  input = gets.chomp
  if input == 'y'
    quit = true
  end
  
end

binding.pry
puts 'Program resumes here'
