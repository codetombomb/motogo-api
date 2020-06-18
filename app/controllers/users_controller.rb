class UsersController < ApplicationController
  include CurrentUserConcern

  def index
    @users = User.all
    render json: @users
  end

  def bike_rent_history
    if @current_user
      @rent_history = []
      my_rented_bikes = []
      my_renter_posts = []
      my_posts = []
      RenterPost.all.map do |rp|
        if rp.renter_id == @current_user.id
          my_renter_posts << rp
        end
      end
      my_renter_posts.each do |post|
        my_posts << Post.find(post.post_id)
      end
      my_posts.each do |mp|
        # byebug
        bike_owner_post = {}
        bike = Bike.find(mp.bike_id)
        owner = User.find(mp.owner_id)
        renter_post = RenterPost.find_by(post_id: mp.id)

        bike_owner_post[:bike] = bike
        bike_owner_post[:owner] = owner
        bike_owner_post[:post] = mp
        bike_owner_post[:renter_post] = renter_post
        my_rented_bikes << bike_owner_post
      end
      render json: {my_rented_bikes: my_rented_bikes}
    else
      render json: { message: "Must be logged in" }
    end
  end
end
