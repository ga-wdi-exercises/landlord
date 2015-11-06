get "/apartments" do
  @apt_list = Apartment.all
  erb :"apartments/index"
end
get "/apartments/new" do
  erb :"apartments/new"
end
put "/apartments" do
  edit_params = params.except("_method")
  edit_params.delete_if {|key, value| value == ""}
  Apartment.create(edit_params)
  redirect '/apartments'
end
get "/apartments/:id" do
  @apt_id = params[:id]
  @apt = Apartment.find(@apt_id)
  erb :"apartments/show"
end
get "/apartments/:id/edit" do
  @apt_id = params[:id]
  @apt = Apartment.find(@apt_id)
  erb :"apartments/edit"
end
patch "/apartments/:id" do
  edit_params = params.except("_method", "id", "splat", "captures")
  edit_params.delete_if {|key, value| value == ""}
  Apartment.find(params[:id]).update(edit_params)
  redirect "/apartments/#{params[:id]}"

end
delete "/apartments/:id" do
  Apartment.find(params[:id]).destroy
  redirect '/apartments'
end
post "/apartments/index" do
  #create new apt here
end
