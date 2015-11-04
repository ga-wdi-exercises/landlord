require 'sinatra'
require 'sinatra/reloader'

# homepage
get '/' do
  puts " 💠 " * 12
  erb :"index"
end


# List all apartments (hardcode into the erb file)
get '/apartments/index' do
  puts " 💠 " * 12
  erb :"apartments/index"
end

# # View a single apartment's details
# get '/apartments/:id' do
  # puts " 💠 " * 12
#  erb :"apartments"
# end
#
# # Create a new apartment - should I use post?
# # Route will show a form for adding a new apartment
# # Form includes address, monthly_rent, sqft, num_beds, num_baths, renters
# get 'apartments/new' do
#   erb :"apartments/new"
# end
#
# # List all tenants for apartment 1
# get '/tenants/:apartment_id' do
#   erb :"tenants"
# end
#
# # Create a new tenant (in apartment 1?)
# # Route will show a form for adding a new tenant
# # Form includes Name, Age, Gender
# get '/tenants/new' do
#   erb :"tenants/new"
# end
