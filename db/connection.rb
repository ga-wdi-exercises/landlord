require "pg"
require "active_record"
require "pry"

ActiveRecord::Base.establish_connection(
 :adapter => "postgresql"
 :database => "landlord"
)
