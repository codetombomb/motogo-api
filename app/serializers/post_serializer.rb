class PostSerializer < ActiveModel::Serializer
  attributes :id, :price_per_day, :description, :bike, :images, :owner

  def bike
    Bike.find(self.object.bike_id)
  end

  def owner
    User.find(self.object.owner_id)
  end

end
