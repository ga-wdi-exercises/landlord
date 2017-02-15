
require "pry"
require "active_record"
require "pg"

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)
