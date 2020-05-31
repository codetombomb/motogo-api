class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :address, :city, :state, :zip_code, :country, :latitude, :longitude, :phone_number, :avatar_url
  has_many :owners
end

