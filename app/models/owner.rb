class Owner < ApplicationRecord

    has_many :bikes
    has_many :posts
    belongs_to :user

end
