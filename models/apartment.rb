class Apartment < ActiveRecord::Base
     has_many :tenants
     def self.get_all
         Apartment.all.each do |apartment|
             puts 'Address:' + apartment.address
             puts 'Rent: $'+ apartment.monthly_rent.to_s
             puts 'Sqft: ' + apartment.sqft.to_s
             puts 'Beds: ' + apartment.num_beds.to_s
             puts 'Baths: ' + apartment.num_baths.to_s
             puts '*******************'
         end
         return
     end

     def self.get_all_ten
         Apartment.all.each do |apartment|
             puts 'Address:' + apartment.address
             puts 'Rent: $'+ apartment.monthly_rent.to_s
             puts 'Sqft: ' + apartment.sqft.to_s
             puts 'Beds: ' + apartment.num_beds.to_s
             puts 'Baths: ' + apartment.num_baths.to_s
             puts "*******************"
             puts  apartment.tenants.get_all
             puts '*******************'
         end
         return
     end
     def get_all
         puts 'Address:' + self.address
         puts 'Rent: $'+ self.monthly_rent.to_s
         puts 'Sqft: ' + self.sqft.to_s
         puts 'Beds: ' + self.num_beds.to_s
         puts 'Baths: ' + self.num_baths.to_s
     end
end
