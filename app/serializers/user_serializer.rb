class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :address, :city, :state, :zip_code, :country, :lat, :lon, :phone_number, :avatar_url, :ip_address
  has_many :owners
end

