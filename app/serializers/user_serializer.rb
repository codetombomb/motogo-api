class UserSerializer < ActiveModel::Serializer

  include Rails.application.routes.url_helpers
  
  attributes :id, :first_name, :last_name, :email, :address, :city, :state, :zip_code, :country, :lat, :lon, :phone_number, :avatar_url, :ip_address, :avatar
  has_many :owners

  def avatar
    if object.avatar.attached?
      {
        url: rails_blob_url(object.avatar)
      }
    end
  end
end

