class RenterPostsController < ApplicationController

    def index
        renter_post = RenterPost.all 
        render json: renter_post
    end

    def create 
        if Renter.find(params['rent_info']['renter_id'])
            renter_id = Renter.find(params['rent_info']['renter_id']).id
        else 
            renter_id = Renter.create(user_id: params['rent_info']['renter_id']).id
        end
        renter_post = RenterPost.create(
            renter_id: renter_id,
            post_id: params['rent_info']["post_id"],
            start_date: params['rent_info']["start_date"],
            end_date: params['rent_info']["end_date"],
            status: params['rent_info']["status"]
            
        )
        if renter_post 
            render json: renter_post
        else
            render json: {error: "Could not create Renter Post"}
        end
    end
end
