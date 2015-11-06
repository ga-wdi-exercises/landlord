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

get "/apartment/:id/edit" do
  @apartment = Apartment.find(params[:id])
  erb :"apartments/edit"
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

# why does Apartment.all array have edited aparments at the end of the array
# even though id has not changed?
put "/apartment/:id" do
  @apartment = Apartment.find(params[:id])
  # why does below code require exception of splat and captures but create
  # method above does not?
  @apartment.update(params.except("_method", "splat", "captures", "id"))
  redirect "/apartment/#{@apartment.id}"
end
