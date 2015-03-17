class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }

	PENALTY = 10


	def check_last_login_date 
		if (self.last_login && self.last_login < 3.days.ago) 
			self.remove_points
		end
	end


	def remove_points
		if (self.points>=10)
			self.update_attribute(:points, self.points-10)
		else
			self.update_attribute(:points, 0)
		end
	end

end