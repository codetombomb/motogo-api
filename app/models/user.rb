class User < ApplicationRecord
    has_many :owners 
    has_many :renters

    
    has_one_attached :avatar
    has_secure_password 
    validates_presence_of :email
    validates_uniqueness_of :email
    geocoded_by :full_address, :if => :address_changed?
    after_validation :geocode


    def full_address  
            "#{self.address}, #{self.city}, #{self.state} #{self.zip_code}, USA "
    end
end
