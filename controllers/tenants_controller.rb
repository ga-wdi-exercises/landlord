delete "/tenants/:id" do
  @apt = Tenant.find(params[:id]).apartment.id
  Tenant.delete(params[:id])
  redirect "/apartments/"+@apt
end

get "/tenants/new" do
  erb :"tenants/new"
end

post "/tenants" do
@name = params[:name]
@age= params[:age]
@gender = params[:gender]
@apartment_id = params[:apartment_id]
binding.pry
Tenant.create(name: @name, age: @age, gender: @gender, apartment_id: @apartment_id)
redirect "/apartment/"+@apartment_id
end
