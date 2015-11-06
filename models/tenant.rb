class Tenant < ActiveRecord::Base
  belongs_to :apartment
  attr_accessor :name, :age, :gender


end
