class Tenant < ActiveRecord::Base
  belongs_to :artist
  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end
end
