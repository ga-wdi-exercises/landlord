class Tenant < ActiveRecord::Base
  belongs_to :apartment

  def to_s
    "#{name}, #{gender}, #{age}"
  end
end
