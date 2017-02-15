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
