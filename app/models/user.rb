# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  email               :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  fbid                :string(255)
#  fbtoken             :string(255)
#  image               :string(255)
#  remember_created_at :datetime
#  remember_token      :string(255)
#

class User < ActiveRecord::Base

	attr_accessible :name, :email, :fbid, :fbtoken, :image
	validates :fbid, presence: true, uniqueness: true

	before_save :create_remember_token

	private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end
