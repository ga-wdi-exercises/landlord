get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments/index"
end
