class User < ActiveRecord::Base
	#ensure emails in db are same format
	before_save { self.email = email.downcase }

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
						length: { maximum: 255 },
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }

	has_many :timeslots
	has_secure_password

	attr_accessor :remember_token

	# returns hash digest of the given string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	# returns random token, used for "remember me".
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		logger.debug "model here. performing remember"
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
		logger.debug "model here. Look what I remembered: #{User.digest(remember_token).inspect.class}"
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	def authenticated?(remember_token)
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end
end




