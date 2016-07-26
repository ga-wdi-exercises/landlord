require "pg" # postgres db library
require "active_record" # the ORM

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord_db"
)
