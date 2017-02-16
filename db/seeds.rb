require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

## Apartments ##
apt_1 = Apartment.create(address: "111 Address Lane",
                         monthly_rent: 1000,
                         sqft: 500,
                         num_beds: 1,
                         num_baths: 1)
apt_2 = Apartment.create(address: "222 Address Lane",
                         monthly_rent: 2000,
                         sqft: 1000,
                         num_beds: 3,
                         num_baths: 2)
apt_3 = Apartment.create(address: "333 Address Lane",
                         monthly_rent: 3000,
                         sqft: 1500,
                         num_beds: 4,
                         num_baths: 3)

# apt_1.save
# apt_2.save
# apt_3.save

#############
## Tenants ##
#############

andy = Tenant.create(name: "Andy",
                     age: "30",
                     gender: "Male",
                     apartment_id: 2)
# andy.save

nayana = Tenant.create(name: "Nayana",
                       age: "27",
                       gender: "Female",
                       apartment_id: 2)
# nayana.save

james = Tenant.create(name: "James",
                      age: "26",
                      gender: "Male",
                      apartment_id: 2)
# james.save

erik = Tenant.create(name: "Erik",
                     age: "26",
                     gender: "Male",
                     apartment_id: 3)
# erik.save

adrian = Tenant.create(name: "Adrian",
                       age: "29",
                       gender: "Male",
                       apartment_id: 3)
# adrian.save

gina = Tenant.create(name: "Gina",
                     age: "22",
                     gender: "Female",
                     apartment_id: 1)
# gina.save

vince = Tenant.create(name: "Vince",
                      age: "22",
                      gender: "Male",
                      apartment_id: 1)
# vince.save

zach = Tenant.create(name: "Zach",
                     age: "23",
                     gender: "Male",
                     apartment_id: 3)
# zach.save

mark = Tenant.create(name: "Mark", age: "22", gender: "Male", apartment_id: 3)
mark.save

kristin = Tenant.create(name: 'Kristin Wisoky', age:"23", gender: "Female", apartment_id: 2)
kristin.save
