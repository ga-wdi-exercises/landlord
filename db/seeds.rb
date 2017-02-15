require_relative 'connection'
require_relative '../models/apartment'
require_relative '../models/tenant'

Tenant.destroy_all
Apartment.destroy_all

  cherokee = Apartment.create(address: "234 Cherokee Way", monthly_rent: 2300, sqft: 190, num_beds: 2, num_baths: 2)
  glove = Apartment.create(address: "234 Glove Way", monthly_rent: 2200, sqft: 200, num_beds: 2, num_baths: 2)
  brook = Apartment.create(address: "234 Brook Way", monthly_rent: 2100, sqft: 160, num_beds: 2, num_baths: 2)

cherokee.tenants.create([{name: 'Leia Cherokee', age: 80, gender: 'Female'},
  {name: 'Tyler Cherokee', age: 90, gender: 'Male'},
  {name: 'Loli Cherokee', age: 60, gender: 'Female'}
]);

glove.tenants.create([{name: 'Tyler Parker', age: 30, gender: 'Male'},
  {name: 'Joe Moise', age: 60, gender: 'Male'},
  {name: 'Sweet Pea', age: 30, gender: 'Female'},
  {name: 'Donald Ross', age: 40, gender: 'Male'},
  {name: 'Brook Weathers', age: 70, gender: 'Female'},
]);

brook.tenants.create([{name: 'Brook Weathers', age: 70, gender: 'Female'},
  {name: 'Joe Stalin', age: 60, gender: 'Male'}
]);
