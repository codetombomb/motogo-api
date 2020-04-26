class Bike < ApplicationRecord
    has_many :post
    has_many_attached :images
    belongs_to :owner
end
