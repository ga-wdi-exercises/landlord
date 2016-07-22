class Tenant < ActiveRecord::Base
     belongs_to :apartment
     def self.get_all
         Tenant.all.each do |tenant|
             puts "Name: #{tenant.name}"
             puts "Age: #{tenant.age}"
             puts "Gender: #{tenant.gender}"
             puts "apartment_id: #{tenant.apartment_id}"
             puts '*******************'
         end
         return
     end

     def self.find_apt(name)
         name_object = Tenant.find_by name:name
         puts "Name: #{name_object.name}"
         puts "Apartment: #{name_object.apartment.get_all}"
     end

     def self.match_apt
         Tenant.all.each do |tenant|
             puts "Name: #{tenant.name}"
             puts "#{tenant.apartment.get_all}"
         end
         return
     end

     def get_info
         return "Name: #{self.name}"
     end
end
