require 'sinatra'
require 'sinatra/reloader'

require_relative 'db_connection'
require_relative 'models/apartment'
require_relative 'models/tenant'
require_relative 'controllers/welcome'
require_relative 'controllers/apartments'
require_relative 'controllers/tenants'

# get '/' do
#   erb:"apartments/show"
# end
#
# get '/apartments' do
#   erb:"apartments/:id"
# end
#
# get '/apartments/new' do
#   erb:"apartments/new"
# end
#
# get '/apartments/:id/tenants' do
#   erb:"apartments/:id/tenants"
# end
