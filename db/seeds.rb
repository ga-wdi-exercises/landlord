require "bundler/setup"
require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Apartment.destroy_all
Tenant.destroy_all

apt_1 = Apartment.create(address: '1111 Blip Top Blvd', monthly_rent: 1750, sqft: 900, num_beds: 1, num_baths: 1)
apt_2 = Apartment.create(address: '345 Sugar Rd', monthly_rent: 3750, sqft: 600, num_beds: 5, num_baths: 2)
apt_3 = Apartment.create(address: '105 Thrills St', monthly_rent: 2100, sqft: 1110, num_beds: 2, num_baths: 4)
apt_1.tenants.create(name: 'bob bob', age: 23, gender: 'Male')
apt_2.tenants.create(name: 'sally tally', age: 45, gender: 'Female')
apt_2.tenants.create(name: 'smacks crackle pop', age: 3, gender: 'Male')
apt_2.tenants.create(name: 'bob bobber', age: 67, gender: 'Male')
apt_2.tenants.create(name: 'hailey scilpton', age: 20, gender: 'Female')
apt_3.tenants.create(name: 'Kelly Michael', age: 25, gender: 'Female')
apt_3.tenants.create(name: 'Michael Michael', age: 52, gender: 'Male')
Tenant.create(name: 'Melanie Fall', age: 42, gender: 'Female')
Tenant.create(name: 'Steve Furlong', age: 44, gender: 'Male')

tenants = Tenant.all
apt_tenants = apt_2.tenants + apt_1.tenants + apt_3.tenants
mel = Tenant.find_by(age: 42).name
mel.gender = 'Male'
mel.save
Tenant.find(2).update(name: 'sal bal')
Tenant.find(2).delete
