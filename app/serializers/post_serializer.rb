class PostSerializer < ActiveModel::Serializer
  attributes :id, :price_per_day, :description, :bike, :images, :owner, :rent_status

  def bike
    Bike.find(self.object.bike_id)
  end

  def owner
    User.find(self.object.owner_id)
  end

  def rent_status
    if RenterPost.find_by(post_id: self.object.id)
      RenterPost.find_by(post_id: self.object.id).status
    else 
      return nil
    end
  end

end
