require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile. Obviates the need for `bundle exec`
require "pg" # postgres db library
require "active_record" # the ORM
# require "pry" # for debugging

require_relative "db/connection" # require the db connection file that connects us to PSQL, prior to loading models
require_relative "models/apartment" # require the Student class definition that we defined in the models/student.rb file
require_relative "models/tenant"

# This will put us into a state of the pry REPL, in which we've established a connection
# with the wdi database and have defined the Student Class as an
# ActiveRecord::Base class.


puts "Enter \"1\" to see all apartments"
puts "Enter \"2\" to see all tenants"
puts "Enter \"3\" to see all apartments and their associated tenants"

input = gets.chomp.to_i

all_apartments = Apartment.all
all_tenants = Tenant.all

if input == 1
  all_apartments.each do |apartment|
    puts apartment.address
  end
end

if input == 2
  all_tenants.each do |tenant|
    puts tenant.name
    puts tenant.apartment_id
  end
end

if input == 3
  all_apartments.each do |apartment|
    puts "#{apartment.address}:"
    apartment.tenants.each do |apt_tenant|
      puts "#{apt_tenant.name}"
    end
  end
end
