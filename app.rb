

require "sinatra"
require "bundler/setup"
require 'sinatra/reloader'
# require_relative "views/index.erb"

# require_relative "models/apartment" # require the Artist class definition that we defined in the models/artist.rb file
# require_relative "models/tenant"

get '/' do
  "<h1>Welcome to the Homepage!</h1>
  <p><a href='/apartments'> >>View All Apartments</a></p>
  <p><a href='/apartments/1'> >>View Apartment Details</a></p>
  <p><a href='/apartments/new'> >>Add an Apartment</a></p>
  <p><a href='/apartments/1/tenants'> >>View All Tenants</a></p>"
end

# "<h1>Current Apartments</h1>"
get '/apartments' do
  names = ['bobert','asdfasdf','qwerqwerqwer']
  @name = names
  erb :index
end

get '/apartments/1' do
  "<h1>Apartment Details</h1>"
end

get '/apartments/new' do
  "<h1>Add an Apartment</h1>"
end

get '/apartments/1/tenants' do
  "<h1>Current Tenants</h1>"
end

# get '/:num' do
#   "<p>#{params[:num]} Bottles of beer on the wall</p>
#   <p><a href='/#{params[:num].to_i-1}'>Drink one!</a></p>"
# end

# get '/' do
#   @name = 'bobert'
#   erb :index
# end
