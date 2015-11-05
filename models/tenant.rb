class Tenant < ActiveRecord::Base

  belongs_to :apartment

  attr_accessor :name
  attr_accessor :age
  attr_accessor :gender
end
