# list apartments
get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments/index"
end

#go to the input form which will pass in the params for the creation
#of a new apartment
get "/apartments/new" do
  erb :"apartments/new"
end

#create an apartment based on the input form
post "/apartments" do
  @apartments = Apartment.create!(address: params[:apartment_address])
  redirect "apartments"
end

#show an apartment matching an id
get "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  erb(:"apartments/show")
end

#edit an apartment found by id
get "/apartments/:id/edit" do
  @apartment = Apartment.find(params[:id])
  erb(:"apartments/edit")
end
