# List all apartments (hardcode into the erb file)
get "/apartments" do
  @apartments = Apartment.all
  puts " 💠 " * 24
  erb :"apartments/index"
end

# Create a new apartment
get "/apartments/new" do
  erb :"apartments/new"
end

# Show a single apartment's details
get "/apartments/:id" do
  @apartment = Apartment.find(params[:id])
  puts " 💠 " * 24
  puts @apartment
  puts " 💠 " * 24

  erb :"apartments/show"
end

# Create new apartment
post "/apartments" do
  @apartment = Apartment.create(params[:apartment])
  redirect("/apartments")
end

# # Create a new tenant (in apartment 1?)
# # Route will show a form for adding a new tenant
# # Form includes Name, Age, Gender
# get '/apartments/:id/tenants/new' do
#
#   erb :"tenants/new"
# end
#
# # List all tenants for apartment
# get '/apartments/:id/tenants' do
#   erb :"tenants/index"
# end
