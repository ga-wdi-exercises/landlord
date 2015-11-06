get "/tenants" do
  @tenant_list = Tenant.all
  erb :"tenants/index"
end
patch "/tenants/:id/edit" do
  edit_params = params.except("_method", "id", "splat", "captures")
  edit_params.delete_if {|key, value| value == ""}
  if edit_params[:apartment_id]
    edit_params[:apartment_id] = Apartment.find_by(address: edit_params[:apartment_id]).id
  end
  Tenant.find(params[:id]).update(edit_params)
  redirect "/tenants/#{params[:id]}"
end
get "/tenants/:id" do
  @tenant = Tenant.find(params[:id])
  @tenant_id = @tenant.id
  erb :"tenants/show"
end
get "/apartments/:id/tenants" do
  @apt = Apartment.find(params[:id])
  @tenant_list = Tenant.where(apartment_id: @apt.id)
  erb :"tenants/show2"
end
put "/apartments/:id/tenants" do
  edit_params = params.except("_method", "id", "splat", "captures")
  edit_params[:apartment_id] = params[:id]
  edit_params.delete_if {|key, value| value == ""}
  Tenant.create(edit_params)
  redirect "/apartments/#{params[:id]}/tenants"
end
delete "/tenants/:id" do
  apt_id= Tenant.find(params[:id]).apartment_id
  Tenant.find(params[:id]).destroy
  redirect "/apartments/#{apt_id}/tenants"
end
get "/apartments/:id/tenants/new" do
  erb :"tenants/new"
end
