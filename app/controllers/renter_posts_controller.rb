class RenterPostsController < ApplicationController

    def index
        renter_post = RenterPost.all 
        render json: renter_post
    end




# TODO: use the parseDate to calculate the differenct in days and multiply times price per day.

# irb(main):005:0> a = Date.parse("12/1/2010")
# => #<Date: 4911063/2,0,2299161>

# irb(main):007:0> b = Date.parse("12/21/2010")
# => #<Date: 4911103/2,0,2299161>

# irb(main):016:0> c = b.mjd - a.mjd
# => 20
    def create 
        num_days = (Date.parse(params['rent_info']['end_date']).mjd - Date.parse(params['rent_info']['start_date']).mjd) 
        total = num_days * params['rent_info']['price_per_day']
        # byebug
        if User.find(params['rent_info']['owner_id'])
            user = User.find(params['rent_info']['owner_id'])
            user.money_made += total 
            user.save
        end

        renter_post = RenterPost.create(
            renter_id: params['rent_info']['renter_id'],
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
