# INDEX
get '/apartments' do
  # binding.pry
  erb :"apartments/index"
end

# NEW
get '/apartments/new' do
  erb :"apartments/new"
end

# CREATE
post '/apartments' do
  # get new artist name from params entered from form
  @new_apartment = params[:new_apartment]
  # create new artist
  Apartment.create(address: @new_apartment)
  # redirect to artist index
  redirect '/apartments'
end

# SHOW
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

# EDIT
get '/apartments/:id/edit' do
  @artist = Apartment.find(params[:id])
  erb :"apartments/edit"
end

# UPDATE
put '/apartments/:id' do
  @edited_apartment = params[:apartment]
  @apartment = Apartment.find(params[:id])
  @apartment.update(name: @edited_apartment)
  redirect "/apartments/#{@apartment.id}"
end

# DESTROY
delete '/apartments/:id' do
  @deleted_apartment = params[:apartment]
  @apartment = Apartment.find(params[:id])
  @apartment.delete
  redirect '/apartments'
end
