require 'sinatra'
require 'sinatra/reloader'
# require 'haml'

get '/' do
  # @name_string = "#{params[:last_name]}, #{params[:first_name]} #{params[:last_name]}!"
  @first_name = "#{params[:first_name]}"
  @last_name = "#{params[:last_name]}"
  # "Hi there, #{params[:last_name]}, #{params[:first_name]} #{params[:last_name]}!"
  erb :index
end

# The homepage should list several menu options:
  # List all apartments (a link to GET /apartments)
  # View an apartment's details(a link to GET /apartments/1)
  # Add an apartment(a link to GET /apartments/new)
  # List tenants (a link to GET /apartments/1/tenants)

get '/apartments' do
  # list all apartments, hardcoded in erb file
  @apartments = apartments
  erb :index
end

get '/apartment/:apartment_id' do
  # view details about given apartment
  @apt_id = params[:apartment_id]
end

get '/apartments/new' do
  # add an apartment, showing a form to add a new apartment and getting input
  # from user per schema
end

get '/apartments/:apartment_id/tenants' do
  # list tenants for given apartment
end

get '/apartments/:apartment_id/tenants/new' do
  # add a new tenant to given apartment using a form that gets input from
  # user per schema
end
