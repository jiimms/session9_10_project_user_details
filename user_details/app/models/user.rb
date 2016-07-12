class User < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :password, presence: true, confirmation: true,
																length: {minimum: 5}
	validates :confirm_password, presence: true
end
