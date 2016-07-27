require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# load the fild to connect to the db
require_relative 'db/connection'

# load models
require_relative 'models/apartment'
require_relative 'models/tenant'

# first step: get the '/' page up on Sinatra
get '/' do
  redirect '/apartments'
end

# 2nd step: redirect '/' to '/apartments' which lists apartment.all using the view from ERB :apartments/index
get '/apartments' do
@apartments = Apartment.all
  erb :"apartments/index"
end
# 3rd step: direct the client to creat a new apartment at the view from ERB :apartments/new
get '/apartments/new' do
  erb :"apartments/new"
end
# 4th step: getting the id of a apartment and feeding into the url to direct the client to a specific apartment page
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end
# 5th step: creates new apartment based off criteria entered in form on View/erb 'new' & redirects based off apartment id
post '/apartments' do
apartment = Apartment.create(params[:apartment])
redirect "apartments/#{apartment.id}"
end
# 6th step: Gets info from the EDIT erb/view for the locally defined apartment id
get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end
# 7th step: is putting/creating a new poke information from the edit. It is updating pokeom parameters and redirecting to a url that corresponds to the poke ID
put '/apartments/:id' do
  @apartments = Apartment.find(params[:id])
  @apartments.update(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end
#Step 8: defines the ability to destroy data then redirects to homepage (/apartments)
delete '/apartments/:id' do
  apartment = Apartment.find(params[:id])
  apartment.destroy
  redirect '/apartments'
end
##########################################################################
                      #tenants
##########################################################################

get '/tenants' do
  @tenants = Tenant.all
    erb :"tenants/index"
  end
  # 3rd step: direct the client to creat a new apartment at the view from ERB :apartments/new
  get '/tenants/new' do
    erb :"tenants/new"
  end
  # 4th step: getting the id of a apartment and feeding into the url to direct the client to a specific apartment page
  get '/tenants/:id' do
    @tenant = Tenant.find(params[:id])
    erb :"tenants/show"
  end
  # 5th step: creates new apartment based off criteria entered in form on View/erb 'new' & redirects based off apartment id
  post '/tenants' do
  tenant = Tenant.create(params[:tenant])
  redirect "tenants/#{tenant.id}"
  end
  # 6th step: Gets info from the EDIT erb/view for the locally defined apartment id
  get '/tenants/:id/edit' do
    @tenant = Tenant.find(params[:id])
    erb :"tenants/edit"
  end
  # 7th step: is putting/creating a new poke information from the edit. It is updating pokeom parameters and redirecting to a url that corresponds to the poke ID
  put '/tenants/:id' do
    @tenants = Tenant.find(params[:id])
    @tenants.update(params[:tenant])
    redirect "/tenants/#{@tenant.id}"
  end
  #Step 8: defines the ability to destroy data then redirects to homepage (/apartments)
  delete '/tenants/:id' do
    tenant = Tenant.find(params[:id])
    tenant.destroy
    redirect '/tenants'
  end
