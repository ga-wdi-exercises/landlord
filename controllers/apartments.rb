
#home page for apt
get "/apartments" do
  @apt = Apartment.all
  erb (:"apartments/index")
end

#apartments all
get '/apartments' do
  erb (:"apartments/index")
end

#create new
get '/apartments/new' do
  erb (:"apartments/new")
end

#show single apt
get '/apartments/:id' do
  erb (:"apartments/show")
end

get '/apartments/:id/tenants' do
  erb (:"tenants/index")
end
