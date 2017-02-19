ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)

# require "pg" # postgres db library
# require "active_record" # the ORM
# require "pry" # for debugging
