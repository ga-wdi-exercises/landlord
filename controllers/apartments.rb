#show all apartments
get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments/index"
end

#show details of apartments
get "/apartments/:apt_id" do
  @apt_details = Apartment.find(params[:apt_id])
  erb :"apartments/show"
end
