require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :index
end

# list all apartments
get '/apartments' do
  erb :apartments

end

# view an apartment's details
get '/apartments/:id' do
  erb :apartments
end

#  add an apartment
get '/apartments/' do
  erb :apartments/new
end

# list tenants in an apartment
get '/apartments/:id/tenants' do
  erb :tenants
end

# add new tenant
get '/apartments/:id/tenants/new' do
  erb :tenants/new
end
