require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Tenant.destroy_all

# create apartments

Apartment.create(address: "1 Generic Lane, Apt 1",
                 monthly_rent: 2100,
                 sqft: 1300,
                 num_beds: 3,
                 num_baths: 1)

Apartment.create(address: "1 Generic Lane, Apt 2",
                monthly_rent: 2100,
                sqft: 1300,
                num_beds: 3,
                num_baths: 1)

Apartment.create(address: "1 Generic Lane, Apt 3",
                 monthly_rent: 2100,
                 sqft: 1300,
                 num_beds: 3,
                 num_baths: 1)

# create tenants

Tenant.create(name: 'Martin Sampson',
              age: 24,
              gender: 'Male',
              apartment_id: 1)

Tenant.create(name: 'Tina Teller',
              age: 29,
              gender: 'Female',
              apartment_id: 1)

Tenant.create(name: 'Alex Cisco',
              age: 26,
              gender: 'Male',
              apartment_id: 1)

Tenant.create(name: 'Maya Cordou',
              age: 21,
              gender: 'Female',
              apartment_id: 2)

Tenant.create(name: 'Emmet Pajaro',
              age: 22,
              gender: 'Male',
              apartment_id: 2)

Tenant.create(name: 'Angie Finn',
              age: 25,
              gender: 'Female',
              apartment_id: 2)

Tenant.create(name: 'Felix Strong',
              age: 28,
              gender: 'Male',
              apartment_id: 3)

Tenant.create(name: 'Margo Anderson',
              age: 25,
              gender: 'Female',
              apartment_id: 3)

Tenant.create(name: 'Eddy Nako',
              age: 27,
              gender: 'Male',
              apartment_id: 3)
