class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :first_name, :last_name, :email, :street, :city, :state, :zip_code, :latitude, :longitude, :phone_number, :avatar
  has_many :owners

  

end
