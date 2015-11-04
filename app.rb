require 'sinatra'
require 'sinatra/reloader'
# require 'haml'


# The homepage should list several menu options:
  # List all apartments (a link to GET /apartments)
  # View an apartment's details(a link to GET /apartments/1)
  # Add an apartment(a link to GET /apartments/new)
  # List tenants (a link to GET /apartments/1/tenants)

get '/' do
  @title = "Landlord App"
  erb :index
end

get '/apartments' do
  # list all apartments, hardcoded in erb file
  @title = "Apartments"

  class Apartment # Generate some test data to display
    attr_accessor :address

    def initialize address
      @address = address
    end

  end
  @apartments = [
    Apartment.new("123 1st Ave"), Apartment.new("234 2nd St")
  ]
  erb :apartments
end

get '/apartment/:apartment_id' do
  # view details about given apartment
  @title = "Apartment at " + ""
  @apt_id = params[:apartment_id]
  @apartment = "" # get apartment by id
  erb :apartment
end

get '/apartments/new' do
  # add an apartment, showing a form to add a new apartment and getting input
  # from user per schema
  @title = "Add New Apartment"
  erb :apartment_new
end

get '/apartments/:apartment_id/tenants' do
  # list tenants for given apartment
  @title = "Tenants for Apartment at " + ""
  @tenants = "" # get tenants at given apartment
  erb :tenents
end

get '/apartments/:apartment_id/tenants/new' do
  # add a new tenant to given apartment using a form that gets input from
  # user per schema
  @title = "Add New Tenant for Apartment at " + ""
  erb :tenant_new
end

# not_found do
#   status 404
#   'not found'
# end
