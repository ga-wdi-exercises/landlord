get "/apartments" do
  @apartments = Apartment.all
  erb :"apartments/index"
end

get "/apartment/:id" do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  erb :"apartments/show"
end

get "/apartments/new" do
  erb :"apartments/new"
end

post "/apartments" do
  @addess = params[:address]
  Apartment.create(params.except("_method"))
  redirect "/apartments"
end

delete "/apartment/:id" do
  @apartment = Apartment.find(params[:id])
  @tenants = @apartment.tenants
  @apartment.destroy
  redirect "/apartments"
end
