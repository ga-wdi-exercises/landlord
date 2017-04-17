require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/apartment"
require_relative "models/tenant"

# got stuck, peeked at solutions, realized should move anchor tags to a separate layout.erb file, and that I needed to require_relative all those files

get '/apartments' do
	@apartments = Apartment.all
	erb :apartments
end

get '/apartments/new' do
	@apartments_new = apartments_new
	erb :apartments_new
end

get '/apartments/[:num]' do
	@num = params[:num].to_i
	erb :apartments_num
end