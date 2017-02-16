require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)

if defined? sinatra
  after do
    ActiveRecord::BASE.connection.close
  end
end
