class SessionSerializer < ActiveModel::Serializer

    include Rails.application.routes.url_helpers
  
    attributes :id, :first_name, :last_name, :email, :password_digest, :address, :city, :state, :zip_code, :country, :lat, :lon, :phone_number, :ip_address, :avatar
  
    def avatar
      if object.avatar.attached?
        {
          url: rails_blob_url(object.avatar)
        }
      end
    end
    
  end
  
  