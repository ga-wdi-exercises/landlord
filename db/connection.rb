require 'active_record'
require 'pg'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)

if defined? Sinatra
  after do
    ActiveRecord::Base.connection.close
  end
end
