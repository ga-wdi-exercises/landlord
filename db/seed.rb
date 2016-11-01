require "active_record"
require "pry"
require_relative "../models/apartment"
require_relative "..//models/tenant"
require_relative "../db/connection"

require "faker"

Tenant.destroy_all
Apartment.destroy_all

rand(1..100).times {
  Apartment.create(
    address: "#{Faker::Address.building_number} #{Faker::Address.street_name} #{Faker::Address.street_suffix}",
    monthly_rent: rand(500..3000),
    num_beds: rand(1..5),
    num_baths: rand(1..3),
    sqft: rand(1000..3000)
  )
}

Apartment.all.each { |apartment|
  rand(0..4).times{
    apartment.tenants.create(
    name: Faker::Name.name,
    age: rand(10..70),
    gender: ["Male",  "Female"].sample
    )
  }
}
