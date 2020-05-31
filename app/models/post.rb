class Post < ApplicationRecord
    belongs_to :bike 
    belongs_to :owner 

    has_many_attached :images
end
