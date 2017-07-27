require 'pg'
require 'pry'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'landlord'
)
