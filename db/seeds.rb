require "bundler/setup"

require "pg"
require "active_record"
require "pry"

require_relative "connection"
require_relative "../models/apartment"
require_relative"../models/tenant"

Apartment.create address ([
  {address: "123 Main Street", monthy_rent: 1900, sqft: 650 num_beds: 1, num_baths: 1},
  {address: "123 Steve Street", monthy_rent: 2200, sqft: 950 num_beds: 2, num_baths: 1.5},
  {address: "256 Jason Street" monthly_rent: 3500, sqft: 1200, numb_beds: 3, num_baths: 2.5}
  ])

  Apartment.tenant.create ([
    {name: "Jimmy", age: 23, gender: "Male"},
    {name: "George", age: 22,  gender: "Male"},
    {name: "Jaclyn", age: 25, gender: "Female"},
    {name: "Tanya", age: 28, gender: "Female"},
    {name: "Tommy", age: 45, gender: "Male"}
    ])

    Apartment.all[0] ([
      {name: "Toni", age:21, gender: "Female"}
      {name: "Tori", age:23, gender: "Female"}
      {name: "Johnny", age:26, gender: "Male"}
      ])

      all_tenants = Tenant.all

      create = save and new
