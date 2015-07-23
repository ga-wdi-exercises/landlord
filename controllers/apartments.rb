# index
get '/apartments' do
  @apartments = Apartment.all
  erb :"apartments/index"
end

# new
get '/apartments/new' do
  erb :"apartments/new"
end

# create
post '/apartments' do
  Apartment.create!(params[:apartment])
  redirect '/apartments'
end

# show
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/show"
end

# edit
get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
end

# update
put '/apartments/:id' do
  apartment = Apartment.find(params[:id])
  apartment.update!(params[:apartment])
  redirect "/apartments/#{apartment.id}" #show
end

# delete
delete '/apartments/:id' do
  Apartment.destroy(params[:id])
  redirect "/apartments" # index
end
