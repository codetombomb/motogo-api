class User < ApplicationRecord
    has_many :owners 
    has_many :renters

    
    has_one_attached :avatar

    has_secure_password 
    validates_presence_of :email
    validates_uniqueness_of :email
    geocoded_by :zip_code
    after_validation :geocode

    def avatar_path
        ActiveStorage::Blob.service.path_for(avatar.key)
    end


end
