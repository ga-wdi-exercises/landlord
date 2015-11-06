
get "/apartments" do
  # binding.pry
  @apartments = Apartment.all
  erb :"apartments/index"
end
