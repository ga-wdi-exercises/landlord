require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Apartment.destroy_all
Tenant.destroy_all

Apartment.create(address: "123 ABC St", monthly_rent: 950, sqft: 1000, num_beds: 3, num_baths: 2)
Apartment.create(address: "456 Sesame St", monthly_rent: 850, sqft: 1200, num_beds: 4, num_baths: 2)
Apartment.create(address: "789 Alleyway Lane", monthly_rent: 450, sqft: 400, num_beds: 1, num_baths: 1)

Tenant.create(name: 'Minny Mouse', age: 70, gender: 'Female', apartment_id: 1);
Tenant.create(name: 'Mickey Mouse', age: 75, gender: 'Male', apartment_id: 1);
Tenant.create(name: 'Daisy Duck', age: 30, gender: 'Female', apartment_id: 2);
Tenant.create(name: 'Donald Duck', age: 40, gender: 'Male', apartment_id: 2);
Tenant.create(name: 'Goofy Dog', age: 50, gender: 'Male', apartment_id: 3);
Tenant.create(name: 'Foghorn Leghorn', age: 60, gender: 'Male', apartment_id: 4);
Tenant.create(name: 'Bugs Bunny', age: 25, gender: 'Male', apartment_id: 5);
Tenant.create(name: 'Babs Bunny', age: 26, gender: 'Female', apartment_id: 5);
Tenant.create(name: 'Tweety Bird', age: 20, gender: 'Female', apartment_id: 9);
Tenant.create(name: 'Sylvester Cat', age: 30, gender: 'Male', apartment_id: 9);
