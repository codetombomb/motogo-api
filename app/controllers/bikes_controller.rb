class BikesController < ApplicationController
    include CurrentUserConcern

    def index
        @bikes = Bike.all 
        render json: @bikes
    end

    def create
        bike = Bike.create!(
            year: params['bike']['year'],
            make: params['bike']['make'],
            model: params['bike']['model'],
            miles: params['bike']['miles'],
            license_plate: params['bike']['licence_plate'],
            bike_name: params['bike']['bike_name'],
            category: params['bike']['category']
            )
            if bike 
                render json: {
                    status: :created_bike,
                    user: bike
                }
            else
            # byebug
            render json: { status: 500 }
        end
    end

    def my_bikes_history 
        if @current_user
            my_bikes = []
            @my_bike_posts = []
            
            # Get all bikes associated with current user
            Bike.all.map do |bike|
                if bike.owner_id == @current_user.id 
                    my_bikes << bike
                end
            end
            
            #Iterate over my bikes and find posts associated with bike
            my_bikes.each do |mb|
                Post.all.map do |post|
                    if post.bike_id == mb.id

                        bike_renter_post = {}
                        bike_renter_post[:bike] = mb
                        bike_renter_post[:post] = post 
                        bike_renter_post[:renter_post] = RenterPost.find_by(post_id: post.id)
                        bike_renter_post[:renter] = User.find(RenterPost.find_by(post_id: post.id).renter.id)

                        @my_bike_posts << bike_renter_post
                    end
                end
            end
            render json: {my_bike_posts: @my_bike_posts}
        else
            render json: { message: "Must be logged in" }
        end
    end

end
