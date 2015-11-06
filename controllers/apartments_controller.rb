# show the index page
get "/apartments" do
  @apt_list = Apartment.all
  erb :"apartments/index"
end
# show the new apt page
get "/apartments/new" do
  erb :"apartments/new"
end
# create a new apt
put "/apartments" do
  edit_params = params.except("_method") # remove unwanted _method key
  edit_params.delete_if {|key, value| value == ""} # remove blank values from the hash
  Apartment.create(edit_params)
  redirect '/apartments'
end
# show a specific apt details
get "/apartments/:id" do
  @apt_id = params[:id]
  @apt = Apartment.find(@apt_id)
  erb :"apartments/show"
end
# the edit apt page
get "/apartments/:id/edit" do
  @apt_id = params[:id]
  @apt = Apartment.find(@apt_id)
  erb :"apartments/edit"
end
# edits an apt here
patch "/apartments/:id" do
  edit_params = params.except("_method", "id", "splat", "captures") # removes unwanted keys from hash
  edit_params.delete_if {|key, value| value == ""} # removes blank strings from hash
  Apartment.find(params[:id]).update(edit_params)
  redirect "/apartments/#{params[:id]}"
end
# deletes an apt
delete "/apartments/:id" do
  Apartment.find(params[:id]).destroy
  redirect '/apartments'
end
