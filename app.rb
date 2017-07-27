# Entry point into the program and homepage routes
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"

require_relative "models/apartment"
require_relative "models/tenant"

require_relative "routes/apartments"
require_relative "routes/tenants"

# The homepage should list several menu options

get '/' do
  erb :index
end
