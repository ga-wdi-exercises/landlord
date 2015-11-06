get "/apartments/:id" do
  @apartment  = Apartment.find(params[:id])
  erb(:"apartments/show")
end

get "/apartments" do
  @apartment = Apartment.all
  erb(:"apartments/index")
end

# get "/apartments/:id" do
#   @apartment  = Apartment.find(params[:id])
#   erb(:"apartments/show")
# end
