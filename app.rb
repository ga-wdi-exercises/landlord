require "sinatra"
require "active_record"
# look for a gem so I Can use that in this file
require_relative "models/apartment"
require_relative "models/tenant"
require_relative "dbconnection"
# look for a file nearby

# get "/" do
#   @pizza = "I Love Pizza"
#   #or
#   erb :index
#   '<h1>This is the root</h1><a href="/apartments"> go to apartments</a>'
# end

get "/apartment" do
  @apartment = apartment.each 
  # @pizza = "hello world apartments"
  # @pizza = Apartment.all
  erb :"apartments/index"
end
