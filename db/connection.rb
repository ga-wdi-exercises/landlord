require "pg"
require "active_record"
require "pry"


ActiveRecord::Base.establish_connection({
  database: 'landlord',
  adapter: 'postgresql'
})

# Fix an issue with sinatra and Active Record where connections are left open
if defined? Sinatra
	after do
	  ActiveRecord::Base.connection.close
	end
end
