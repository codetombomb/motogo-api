class Renter < ApplicationRecord
    belongs_to :user
    has_many :renter_post
    has_many :posts, through: :renter_post
end
