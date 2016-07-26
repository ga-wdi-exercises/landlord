require "pg"
require "active_record"
require "pry"

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord_db"
)

if defined? Sinatra
  after do
    ActiveRecord::Base.connection.close
  end
end
