

require 'sinatra'
require 'sinatra/reloader'

require_relative "db/connection"

require_relative "models/apartment"
require_relative "models/tenant"

get '/' do
  erb :"home"
end
# all apartments page
get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end
# new apartment page
get '/apartments/new' do
  erb :"apartments/new"
end
# apartment create
post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end
# apartment edit
get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end
# tenants of apartment
get '/apartments/:id/tenants' do
  @apartment = Apartment.find(params[:id])
  @tenants = Tenant.where('apartment_id = ?', @apartment.id)
  erb :"apartments/tenants"
end
# edit request for apartment
put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end
# show single apartment
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

# delete tenant
delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect "/apartments"
end
# show all tenants
get '/tenants' do
  @tenants = Tenant.all
  erb :"tenants/index"
end
# new tenant page
get '/tenants/new' do
  erb :"tenants/new"
end
# add tenants
post '/tenants' do
  @tenant = Tenant.create(params[:tenant])
  redirect "/tenants/#{@tenant.id}"
end
# edit tenant page
get '/tenants/:id/edit' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/edit"
end
# update tenant info in db
put '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @tenant.update(params[:tenant])
  redirect "/tenants/#{@tenant.id}"
end
# show tenant
get '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  erb :"tenants/show"
end
# delete
delete '/tenants/:id' do
  @tenant = Tenant.find(params[:id])
  @tenant.destroy
  redirect "/tenants"
end
