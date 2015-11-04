class Tenant < ActiveRecord::Base
  belongs_to :apartment
end

# require "pry"

# class Tenant

# 	def initialize (name, age, gender)
# 		@name = name
# 		@age = age
# 		@gender = gender
# 	end
# 	def name
# 		@name
# 	end
# 	def age
# 		@age
# 	end
# 	def gender
# 		@gender
# 	end

# end

# j = Tenant.new("Jane", 21, "F")

# binding.pry