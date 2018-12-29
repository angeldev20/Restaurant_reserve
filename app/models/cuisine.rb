class Cuisine < ApplicationRecord
    has_many :cuisine_memberships
	has_many :restaurants, through: :cuisine_memberships, dependent: :destroy
end
