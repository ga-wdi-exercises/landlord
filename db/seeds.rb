require_relative "connection"
require_relative "../models/apartment"
require_relative "../models/tenant"

Tenant.destroy_all
Apartment.destroy_all




apartment1 = Apartment.create(address:"3509 chillum ave",
monthly_rent: "1200",
sqft: "600",
num_beds:"1",
num_baths:"1")

apartment2 = Apartment.create(address:"2109 beverly hills top",
monthly_rent: "1200",
sqft: "600",
num_beds:"1",
num_baths:"1")

apartment3 = Apartment.create(address:"1209 mandelaway",
monthly_rent: "1200",
sqft: "600",
num_beds:"1",
num_baths:"1")




apartment1.tenants.create([
  {name: "john",
  age: 40,
  gender: "male"},

  {name: "missy",
   age: 40,
    gender: "female"
  },

 {name: "molly",
  age: 40,
  gender: "female"}
])

apartment2.tenants.create([
  {name: "micheal",
  age: 40,
  gender: "male"},

  {name: "mona",
   age: 40,
    gender: "female"
  },

 {name: "mina",
  age: 40,
  gender: "female"}
])

apartment3.tenants.create([
  {name: "sunny",
  age: "40",
  gender: "male"},

  {name: "sasha",
   age: 40,
    gender: "female"
  },

 {name: "malia",
  age: 40,
  gender: "female"}
])


binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
