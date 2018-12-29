class Restaurant < ApplicationRecord
	default_scope { order ({ name: :asc }) }

	extend FriendlyId
	friendly_id :name, use: :slugged

	mount_uploaders :images, ImageUploader
	has_many :attachments
	accepts_nested_attributes_for :attachments
	
	has_many :favorites
	has_many :users, through: :favorites
	has_many :reservations
	has_many :coupons
	accepts_nested_attributes_for :coupons
	has_one :category
	
	has_many :cuisine_memberships
	has_many :cuisines, through: :cuisine_memberships, dependent: :destroy
	
end