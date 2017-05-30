require 'bundler/setup'
require 'pry'

require_relative "connection"
require_relative "../models/apartments"
require_relative "../models/tenants"

Tenant.destroy_all
Apartment.destroy_all


kazanci_apartment =  Apartment.create(address: '13249 Alcove Path', monthly_rent: 2000, sqft: 2500 , num_beds:3 , num_baths: 2)
kusol_apartment = Apartment.create(address: '4142 Monument Hills Way', monthly_rent: 3000, sqft: 3500, num_beds: 4, num_baths: 3)
anvarov_apartment =  Apartment.create(address: '3113 Cabot Dr', monthly_rent: 4000, sqft: 4500, num_beds: 5, num_baths: 4)


kazanci_apartment.tenants.create(name: 'Tarik Kazanci', age: 23, gender: 'Male')
kazanci_apartment.tenants.create(name: 'Fetah Kazanci', age: 56, gender: 'Male')
kazanci_apartment.tenants.create(name: 'Ayse Kazanci', age: 47, gender: 'Female')
kazanci_apartment.tenants.create(name: 'Omer Kazanci', age: 22, gender: 'Male')

kusol_apartment.tenants.create(name: 'Ahmet Kusol', age: 24, gender: 'Male')
kusol_apartment.tenants.create(name: 'Kadir Sever', age: 24, gender: 'Male')

anvarov_apartment.tenants.create(name: 'Alisher Anvarov', age: 30, gender: 'Male')
anvarov_apartment.tenants.create(name: 'Bahtiyor Anvarov', age: 19, gender: 'Male')
