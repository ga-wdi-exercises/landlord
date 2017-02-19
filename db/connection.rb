require 'pg'
require 'active_record' #why was this necessary here, but not in the sample app?

ActiveRecord::Base.establish_connection(
:adapter => "postgresql",
:database => "landlord" #might should be landlord_db
)
