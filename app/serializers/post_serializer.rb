class PostSerializer < ActiveModel::Serializer
  attributes :id, :price_per_day, :description, :bike, :images

  def bike
    Bike.find(self.object.bike_id)
  end

end
