class RenterPost < ApplicationRecord
    belongs_to :renter 
    belongs_to :post 
end
