### NOTE: Make sure you've loaded the seeds.sql file into your DB before starting
### this exercise

require "pg" # postgres db library
require "active_record" # the ORM
require "pry" # for debugging

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "landlord"
)

class Tenant < ActiveRecord::Base
  belongs_to :apartment
end

class Apartment < ActiveRecord::Base
  has_many :tenants
end

################################################
#### NOTE: DON'T MODIFY ABOVE THIS LINE     ####
################################################


              ################################################
              # FINDING / SELECTING
              ################################################

              # Hint, the following methods will help: `where`, `all`, `find`, `find_by`

              # Use Active record to do the following, and store the results **in a variable**
              # example: get every tenant in the DB
all_tenants = Tenant.all
################################################

pry
              # [2] pry(main)>

################################################
              # get the first tenant in the DB
tenant_first = Tenant.first
                  # => #<Tenant:0x007f8070f6db30 id: 1, name: "Maudie Mosciski", age: 90, gender: "Female", apartment_id: 1>

################################################
              # get all tenants older than 65
tenant_65 = Tenant.where("age > 65")
                  # [10] pry(main)> tenant_65 = Tenant.where("age > 65")
                  # => [#<Tenant:0x007f8070dd6768 id: 1, name: "Maudie Mosciski", age: 90, gender: "Female", apartment_id: 1>,
                   #<Tenant:0x007f8070dd6588 id: 3, name: "Demario King", age: 71, gender: "Female", apartment_id: 2>,
                   #<Tenant:0x007f8070dd63a8 id: 4, name: "Kaitlin Cormier", age: 91, gender: "Male", apartment_id: 3>,
                   #<Tenant:0x007f8070dd61c8 id: 6, name: "Valentin Keebler Sr.", age: 74, gender: "Male", apartment_id: 5>,
                   #<Tenant:0x007f8070dd5fe8 id: 12, name: "America Pollich", age: 82, gender: "Female", apartment_id: 7>,
                   #<Tenant:0x007f8070dd5db8 id: 15, name: "Sherwood Stiedemann", age: 72, gender: "Female", apartment_id: 8>,
                   #<Tenant:0x007f8070dd5bb0 id: 18, name: "Mason Blanda", age: 83, gender: "Female", apartment_id: 9>,
                   #<Tenant:0x007f8070dd58e0 id: 27, name: "Bartholome Herman", age: 93, gender: "Male", apartment_id: 11>,
                   #<Tenant:0x007f8070dd56b0 id: 29, name: "Helmer Grimes", age: 80, gender: "Female", apartment_id: 14>,
                   #<Tenant:0x007f8070dd52f0 id: 30, name: "Derrick Farrell", age: 81, gender: "Male", apartment_id: 14>,
                   #<Tenant:0x007f8070dd4be8 id: 38, name: "Javier Boehm", age: 82, gender: "Female", apartment_id: 15>,
                   #<Tenant:0x007f8070dd4aa8 id: 46, name: "Conner Dare", age: 92, gender: "Male", apartment_id: 18>,
                   #<Tenant:0x007f8070dd4968 id: 48, name: "Carlee Nolan", age: 77, gender: "Female", apartment_id: 18>,
                   #<Tenant:0x007f8070dd46e8 id: 53, name: "Bennett Jakubowski", age: 69, gender: "Female", apartment_id: 20>,
                   #<Tenant:0x007f8070dd45a8 id: 54, name: "Annette Stamm", age: 76, gender: "Male", apartment_id: 20>]

################################################
              # get all apartments whose price is greater than $2300
apt_gt_2300 = Apartment.where("monthly_rent > 2300")
                  [12] pry(main)> apt_gt_2300 = Apartment.where("monthly_rent > 2300")
                  => [#<Apartment:0x007f806fab9770 id: 5, address: "95287 Kamille Underpass", monthly_rent: 2800, sqft: 1400, num_beds: 1, num_baths: 3>,
                   <Apartment:0x007f806fab9630 id: 7, address: "95599 Koch Stream", monthly_rent: 2400, sqft: 1900, num_beds: 2, num_baths: 4>,
                   <Apartment:0x007f806fab94f0 id: 9, address: "62897 Verna Walk", monthly_rent: 2400, sqft: 700, num_beds: 2, num_baths: 3>,
                   <Apartment:0x007f806fab93b0 id: 15, address: "2745 Freddy Vista", monthly_rent: 2800, sqft: 1400, num_beds: 4, num_baths: 4>,
                   <Apartment:0x007f806fab9270 id: 16, address: "359 Gutmann Pike", monthly_rent: 2700, sqft: 1900, num_beds: 2, num_baths: 1>,
                   <Apartment:0x007f806fab9130 id: 19, address: "7357 Emard Row", monthly_rent: 2600, sqft: 2300, num_beds: 3, num_baths: 2>]


################################################
              # get the apartment with the address "6005 Damien Corners"
apt_6005_damien = Apartment.find_by(address: "6005 Damien Corners")
                  # [13] pry(main)> apt_6005_damien = Apartment.find_by(address: "6005 Damien Corners")
                  # => #<Apartment:0x007f8070e8d558 id: 6, address: "6005 Damien Corners", monthly_rent: 400, sqft: 2300, num_beds: 4, num_baths: 1>


################################################
              # get all tenants in that apartment
apt_6005_damien_tenants = Apartment.find_by(address: "6005 Damien Corners").tenants
                  # [14] pry(main)> apt_6005_damien_tenants = Apartment.find_by(address: "6005 Damien Corners").tenants
                  # => [#<Tenant:0x007f8070d87118 id: 7, name: "Ms. Garland Beatty", age: 60, gender: "Female", apartment_id: 6>,
                   #<Tenant:0x007f806fa3f470 id: 8, name: "Eryn Lynch", age: 12, gender: "Male", apartment_id: 6>]

################################################
      # Use `each` and `puts` to:
              # Display the name and ID # of every tenant
              # http://stackoverflow.com/questions/7911014/activerecord-find-and-only-return-selected-columns
tenant_name_n_id = Tenant.pluck(:name, :id)
                            # [22] pry(main)> tenant_name_n_id = Tenant.pluck(:name, :id)
                            # => [["Maudie Mosciski", 1],
                            #  ["Kristin Wisoky", 2],
                            #  ["Demario King", 3],
                            #  ["Kaitlin Cormier", 4],
                            #  ["Rosalinda Champlin", 5],
                            # ...


################################################
                    # http://guides.rubyonrails.org/active_record_querying.html#conditions
              # Iterate over each apartment, for each apartment, display it's address and rent price
apt_addr_n_rent = Apartment.pluck(:address, :monthly_rent)
                            # [24] pry(main)> apt_addr_n_rent = Apartment.pluck(:address, :monthly_rent)
                            # => [["70335 Clemenargaertine Tunnel", 800],
                            #  ["44010 Lemke Crossroad", 1000],
                            #  ["77841 Jany Lane", 700],
                            #  ["4518 Ivy Spur", 2000],
                            #  ["95287 Kamille Underpass", 2800],
                            # ...

################################################
              # Iterate over each apartment, for each apartment, display it's address and all of it's tenants
                            # !!!
                            # DING DING DING
                            # !!!
                            # HERES OUR WINNER !!!
                            # THIS IS HOW THE OUTPUT SHOULD LOOK,
                            # USING THE where CLAUSE FOR Tenant
                            # INSTEAD OF THE 2 find_byS FROM THE ORIGINAL
                            # BECAUSE THE find/find_byS ONLY RETURN THE FIRST RECORD THAT MEETS THE SELECTION CRITERIA
Apartment.all.each do |apartment|
puts "#{apartment.address} #{Tenant.find_by(apartment_id: apartment.id) ? Tenant.where('apartment_id=?',apartment.id).pluck(:name).join(', ') : ''}"
end
              # [77] pry(main)> Apartment.all.each do |apartment|
              # [77] pry(main)*   puts "#{apartment.address} #{Tenant.find_by(apartment_id: apartment.id) ? Tenant.where('apartment_id=?',apartment.id).pluck(:name).join(', ') : ''}"
              # [77] pry(main)* end
              #               70335 Clemenargaertine Tunnel Maudie Mosciski, Kristin Wisoky
              #               44010 Lemke Crossroad Demario King
              #               77841 Jany Lane Kaitlin Cormier, Rosalinda Champlin
              #               4518 Ivy Spur
              #               95287 Kamille Underpass Valentin Keebler Sr.
              #               6005 Damien Corners Ms. Garland Beatty, Eryn Lynch
              #               95599 Koch Stream Tiara Conn, Tillman Schroeder, Amber Jewess, America Pollich, Mylene Krajcik
              #               40583 Hal Crossing Josh Gottlieb, Sherwood Stiedemann, Katarina Kunde
              #               62897 Verna Walk Mabelle Eichmann, Mason Blanda, Sonny Dibbert I, Gus Herman II, Delia Christiansen MD, Willow Ledner Jr.
              #               351 Dibbert Fields Titus Harvey, Ms. Randal Konopelski
              #               3710 Buford Passage Caleb Maggio, Hilbert Effertz, Bartholome Herman, Merritt Durgan
              #               64329 Tyree Creek
              #               17297 Runte Bypass
              #               0889 Marvin Radial Helmer Grimes, Derrick Farrell, Enola Sauer V, Jimmy Bartell
              #               2745 Freddy Vista Christophe Boyle DVM, Miss Wanda Kris, Miss Maeve Goldner, Noemie Daniel, Shanna Jacobson, Javier Boehm
              #               359 Gutmann Pike Aurelia Harvey, Dangelo Bogisich, Benton Abernathy, Marina Kemmer, Dasia Vandervort
              #               08465 Howell Harbor Bo Medhurst
              #               8865 Borer Viaduct Elta Fay, Conner Dare, Dr. Lindsey Reichert, Carlee Nolan, Bernie Weimann, Jose Denesik
              #               7357 Emard Row
              #               => [#<Apartment:0x007f80701048c8 id: 1, address: "70335 Clemenargaertine Tunnel", monthly_rent: 800, sqft: 1900, num_beds: 3, num_baths: 2>,

              ################################################
              # CREATING / UPDATING / DELETING
              ################################################

              # Hint, the following methods will help: `new`, `create`, `save`, `uddate`, `destroy`


################################################
              # Create 3 new apartments, and save them to the DB
                  ################################################
                  # THIS WORKS TOO IN A SINGLE LINE, NOT A BLOCK
                  # REQUIRES CURLY BRACES AROUND TH CONTENTS OF THE
                  # do .. end BLOCK
apartment = Apartment.new do |a| {a.address = "999 roadToHell Way" a.monthly_rent = 111 a.sqft = 111 a.num_beds = 111 a.num_baths = 111 } end
                  # AND THIS BLOCK WAY WORKS TOO
apartment = Apartment.new do |a|
  a.address = "999 roadToHell Way"
  a.monthly_rent = 111
  a.sqft = 111
  a.num_beds = 111
  a.num_baths = 111
  puts "---------------------- THE ADDRESS FOR THIS NEW APARTMENT IS:  #{a.address}"
end
puts "save apartment now"
apartment.save
puts "---------------------- THE ------ID------ FOR THIS NEW APARTMENT IS:  #{apartment.id}"
Apartment.all
                    # [151] pry(main)*   a.num_baths = 111
                    # [151] pry(main)*   puts "---------------------- THE ------ID------ FOR THIS NEW APARTMENT IS:  #{apartment.id}"
                    # [151] pry(main)*   puts "---------------------- THE ADDRESS FOR THIS NEW APARTMENT IS:  #{apartment.address}"
                    # [151] pry(main)* end
                    # ---------------------- THE ------ID------ FOR THIS NEW APARTMENT IS:  34
                    # ---------------------- THE ADDRESS FOR THIS NEW APARTMENT IS:  999 roadToHell Way
                    # => #<Apartment:0x007f8070e6d9d8 id: nil, address: "999 roadToHell Way", monthly_rent: 111, sqft: 111, num_beds: 111, num_baths: 111>
                    # [152] pry(main)> puts "save apartment now"
                    # save apartment now
                    # => nil
                    # [153] pry(main)> apartment.save
                    # => true
                    # [154] pry(main)> puts "---------------------- THE ------ID------ FOR THIS NEW APARTMENT IS:  #{apartment.id}"
                    # ---------------------- THE ------ID------ FOR THIS NEW APARTMENT IS:  35
                    # => nil
                    # [155] pry(main)> Apartment.all
                    # => [#<Apartment:0x007f806fa16c78 id: 1, address: "70335 Clemenargaertine Tunnel", monthly_rent: 800, sqft: 1900, num_beds: 3, num_baths: 2>,
                    #  #<Apartment:0x007f806fa15c60 id: 2, address: "44010 Lemke Crossroad", monthly_rent: 1000, sqft: 1300, num_beds: 1, num_baths: 3>,
                    #  #<Apartment:0x007f806fa15a58 id: 3, address: "77841 Jany Lane", monthly_rent: 700, sqft: 2300, num_beds: 4, num_baths: 3>,
                    #  #<Apartment:0x007f806fa15530 id: 4, address: "4518 Ivy Spur", monthly_rent: 2000, sqft: 1000, num_beds: 1, num_baths: 2>,
                    #  #<Apartment:0x007f806fa153c8 id: 5
                    ...
                     #<Apartment:0x007fd125d3c478 id: 19, address: "7357 Emard Row", monthly_rent: 2600, sqft: 2300, num_beds: 3, num_baths: 2>,
                     #<Apartment:0x007fd125d3c270 id: 20, address: "999 roadToHell Way", monthly_rent: 111, sqft: 111, num_beds: 111, num_baths: 111>,
                     #<Apartment:0x007fd125d3c108 id: 21, address: "999 roadToHell Way", monthly_rent: 111, sqft: 111, num_beds: 111, num_baths: 111>,
                     #<Apartment:0x007fd125d37ef0 id: 22, address: "999 roadToHell Way", monthly_rent: 111, sqft: 111, num_beds: 111, num_baths: 111>,
                     #<Apartment:0x007fd125d37ce8 id: 23, address: "999 roadToHell Way", monthly_rent: 111, sqft: 111, num_beds: 111, num_baths: 111>]


################################################
              # Create at least 9 new tenants and save them to the DB. (Make sure they belong to an apartment)
              # Note: you'll use this little bit of code as a `seeds.rb` file later on.
              tenant = Tenant.new do |t|
                t.name = "Betty Boop 111"
                t.age = 111
                t.gender = "Female"
                t.apartment_id = "20"
                puts "---------------------- THE ------NAME------ FOR THIS NEW TENANT IS:  #{t.name}"
              end
              puts "save tenant now"
              tenant.save
              puts "---------------------- THE ------ID------ FOR THIS NEW TENANT IS:  #{t.id}"
              Tenant.all

                  #                 $ for x in {1..11}; do echo  "tenant = Tenant.new(name = 'betty_boop_${x}', age = ${x}, gender = 'Female', apartment_id = ${x} )"; done;
                  # tenant = Tenant.new(name = 'betty_boop_1', age = 1, gender = 'Female', apartment_id = 1 )
                  # tenant = Tenant.new(name = 'betty_boop_2', age = 2, gender = 'Female', apartment_id = 2 )
              # ...

              # Birthday!
              # It's Kristin Wisoky's birthday. Find her in the DB and change her age to be 1 year older
              # Note: She's in the seed data, so she should be in your DB

              # Rennovation!
              # Find the apartment "62897 Verna Walk" and update it to have an additional bedroom
              # Make sure to save the results to your database

              # Rent Adjustment!
              # Update the same apartment that you just 'rennovated'. Increase it's rent by $400
              # to reflect the new bedroom

              # Millenial Eviction!
              # Find all tenants who are under 30 years old
              # Delete their records from the DB
binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
