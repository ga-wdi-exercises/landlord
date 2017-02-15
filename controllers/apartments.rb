get '/apartments' do
  @apartments = Apartment.all
  erb :'apartments/index'
end

get '/apartments/:id' do
  @apartment = Apartment.find(params[:id])
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

post '/apartments/:id' do
  
end
