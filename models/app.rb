require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging



all_apartments= Apartment.all
puts all_apartments
all_tenants = Tenant.all
# puts all_tenants [:]
#

binding.pry

puts "End of program"
