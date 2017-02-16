### Route to list all apartments ###
get '/apartments' do
  @apartments = Apartment.all
  erb :'apartments/index'
end


### Routes for creating new apartments ###

get '/apartments/new' do
  erb :'apartments/new'
end

post '/apartments' do
  @apartment = Apartment.create(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end


### Routes for viewing and editing existing apartments ###
get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :'apartments/individual_apartment'
end

get '/apartments/:id/edit' do
  @apartment = Apartment.find(params[:id])
  erb :'apartments/edit'
end

put '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
  @apartment.update(params[:apartment])
  redirect "/apartments/#{@apartment.id}"
end


### Route to delete apartments ###
delete '/apartments/:id/delete' do
  @apartment = Apartment.find(params[:id])
  @apartment.destroy
  redirect "/apartments"
end
