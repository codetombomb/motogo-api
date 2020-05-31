class User < ApplicationRecord
    has_many :owners 
    has_many :renters

    PHONE_NUMBER_PATTERN = "^[2-9]\d{2}-\d{3}-\d{4}$"

    has_one_attached :avatar
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates_presence_of :phone_number, format: { with: PHONE_NUMBER_PATTERN }
    geocoded_by :ip_address, :latitude => :lat, :longitude => :lon
    after_validation :geocode

    has_secure_password 


end
