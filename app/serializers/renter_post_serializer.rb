class RenterPostSerializer < ActiveModel::Serializer
  attributes :id, :renter, :post, :start_date, :end_date, :rent_status

  def renter
    User.find(self.object.renter_id)
  end

  def post
    Post.find(self.object.post_id)
  end

  def rent_status
    if self.object.start_date <= Date.today && self.object.end_date >= Date.today 
      return "Currently Rented"
    elsif self.object.start_date > Date.today 
      number_of_days = (self.object.start_date - Date.today ).to_int
      return "Scheduled for rental in #{number_of_days} days"
    elsif self.object.end_date < Date.today
      return "Available"
    end
  end
end
