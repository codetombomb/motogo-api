class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :address, :city, :state, :zip_code, :phone_number
  has_many :owners
end
