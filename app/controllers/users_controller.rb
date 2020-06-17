class UsersController < ApplicationController
  include CurrentUserConcern

  def index
    @users = User.all
    render json: @users
  end

  def bike_rent_history
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
      bike_and_owner = {}
      bike = Bike.find(mp.bike_id)
      owner = User.find(mp.owner_id)
      bike_and_owner[:bike] = bike
      bike_and_owner[:owner] = owner
      my_rented_bikes << bike_and_owner
    end
    render json: { my_rented_bikes: my_rented_bikes, my_posts: my_posts, my_renter_posts: my_renter_posts }
  end
end

# def bike_rent_history
#   @rent_history = []
#         @my_bikes = []
#         @my_bike_history = []
#         RenterPost.all.map do |rp|
#           if Owner.find(rp.post.owner_id).user.id == @current_user.id
#             @rent_history << rp
#           end
#         end
#         Bike.all.map do |bike|
#           if bike.owner_id == @current_user.id
#             @my_bikes << bike
#           end
#         end
#         @my_bikes.map do |bike|
#           Post.all.map do |post|
#             if Post.find_by(bike_id: bike.id)
#              post = Post.find_by(bike_id: bike.id)
#              @my_bike_history << RenterPost.find_by(post_id: post.id)
#             end
#           end
#         end

#         render json: {rent_history: @rent_history, my_bike_history: @my_bike_history}
# end
