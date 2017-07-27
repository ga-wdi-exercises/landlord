# All /apartment routes

# The route GET /apartments should list all apartments
get '/apartments' do
  @apartments = Apartment.all
  erb :'apartments/index'
end

# Add an apartment(a link to GET /apartments/new)
# The route GET /apartments/new should show a form for adding a new apartment
# Make sure to get the appropriate input from the user when creating an apartment as per schema
get '/apartments/new' do
  # erb :'apartments/new'
  erb :'apartments/new'
end

post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment[:id]}"
end

# View an apartment's details(a link to GET /apartments/1)
# The route GET /apartments/1 should show info about a single apartment
# Tell the user the address, monthly_rent, sqft, num_beds, num_baths, and renters
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :'apartments/show'
end

# update
get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :'apartments/edit'
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end

#delete
delete '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect '/apartments'
end
