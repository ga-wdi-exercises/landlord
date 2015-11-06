get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments/apartments_index"
end

get "/apartments/new" do
  erb :"apartments/apartments_new"
end

get "/apartments/:id" do
  @apartment = Apartment.find(params[:id].to_i)
  erb :"apartments/apartments_details"
end
