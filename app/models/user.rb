class User < ApplicationRecord
    has_many :owners 
    has_many :renters

    
    has_one_attached :avatar
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates_presence_of :email
    validates_uniqueness_of :email
    geocoded_by :full_address
    after_validation :geocode
    
    has_secure_password 

    def full_address  
            "#{self.address}, #{self.city}, #{self.state} #{self.zip_code}, #{self.country} "
    end
end
