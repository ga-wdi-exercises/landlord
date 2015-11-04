Apartment.destroy_all
Tenant.destroy_all

apt1 = Apartment.create(address: "6178 Kelly Dr", monthly_rent: 2352, sqft: 800, num_beds: 2, num_baths: 2)
apt2 = Apartment.create(address: "1747 Greenhaven Ln", monthly_rent: 1932, sqft: 1200, num_beds: 3, num_baths: 2)
apt3 = Apartment.create(address: "6992 W Tropical Pkwy", monthly_rent: 1252, sqft: 1350, num_beds: 2, num_baths: 1)

Tenant.create(name: "Clarence Crawford", age: 45, gender: "Male", apartment_id: apt3.id)
Tenant.create(name: "Marjorie Flores", age: 29, gender: "Female", apartment_id: apt2.id)
Tenant.create(name: "Christina Dunn", age: 26, gender: "Female", apartment_id: apt1.id)
Tenant.create(name: "Madison Graves", age: 32, gender: "Female")
Tenant.create(name: "Zoe Webb", age: 33, gender: "Female")
Tenant.create(name: "Leon Montgomery", age: 37, gender: "Male", apartment_id: apt3.id)
Tenant.create(name: "Mario Meyer", age: 30, gender: "Male", apartment_id: apt1.id)
Tenant.create(name: "Courtney Willis", age: 28, gender: "Female")
Tenant.create(name: "Liam Hicks", age: 23, gender: "Male")

all_tenants = Tenant.all
apt1_tenants = Tenant.where(apartment_id: 23)

update_tenant = all_tenants.find_by(name: "Zoe Webb")
update_tenant.age = 22
update_tenant.save

update_rent = apt2
update_rent.update(monthly_rent: 1914)

eviction = all_tenants.find_by(name: "Liam Hicks")
eviction.destroy
