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
def all_apartments
    Apartment.all.each { |apt| puts "#{apt.address} ++++ #{apt.monthly_rent}"}
end

def all_tenants
    Tenant.all.each { |apt| puts "#{apt.name} === #{apt.id}" }
end

def apartments_with_tenants
    Apartment.all.each do |apt|
        puts "#{apt.address}"
        Tenant.all.each do |tenant|
            puts tenant.name if tenant.apartment_id == apt.id
        end
    end
end
binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
