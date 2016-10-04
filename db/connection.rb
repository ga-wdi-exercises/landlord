require "pg" # postgres db library
require "active_record" # the ORM
require "pry"


ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)



binding.pry
puts "end"
