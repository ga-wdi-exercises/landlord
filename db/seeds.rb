require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Tenant.destroy_all

abc = Apartment.create(address: "123 ABC St", monthly_rent: 950, sqft: 1000, num_beds: 3, num_baths: 2)
sesame = Apartment.create(address: "456 Sesame St", monthly_rent: 850, sqft: 1200, num_beds: 4, num_baths: 2)
alley = Apartment.create(address: "789 Alleyway Lane", monthly_rent: 450, sqft: 400, num_beds: 1, num_baths: 1)
bat = Apartment.create(address: "101 Batcave Cove", monthly_rent: 5000, sqft: 2000, num_beds: 10, num_baths: 5)

Tenant.create(name: 'Minny Mouse', age: 70, gender: 'Female', apartment: abc);
Tenant.create(name: 'Mickey Mouse', age: 75, gender: 'Male', apartment: abc);
Tenant.create(name: 'Daisy Duck', age: 30, gender: 'Female', apartment: sesame);
Tenant.create(name: 'Donald Duck', age: 40, gender: 'Male', apartment: sesame);
Tenant.create(name: 'Goofy Dog', age: 50, gender: 'Male', apartment: alley);
Tenant.create(name: 'Foghorn Leghorn', age: 60, gender: 'Male', apartment: alley);
Tenant.create(name: 'Batman', age: 25, gender: 'Male', apartment: bat);
Tenant.create(name: 'Robin', age: 26, gender: 'Male', apartment: bat);
Tenant.create(name: 'Tweety Bird', age: 20, gender: 'Female', apartment: alley);
Tenant.create(name: 'Sylvester Cat', age: 30, gender: 'Male', apartment: alley);
