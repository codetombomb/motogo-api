class PostsController < ApplicationController

    def index
        @posts = Post.all 
        render json: @posts
    end

    def create 
        if Owner.find(params['user']['id'])
            @owner = Owner.find(params['user']['id'])
        else
            @owner = Owner.new(user_id: params['user']['id'])
        end
        @bike = Bike.create(
            owner_id: @owner.id,
            year: params['bike']['year'],
            make: params['bike']['make'],
            model: params['bike']['model'],
            miles: params['bike']['miles'],
            license_plate: params['bike']['license_plate'],
            bike_name: params['bike']['bike_name'],
            category: params['bike']['category']
        )
        if @owner && @bike
            render json: @bike
        else
            render json: { status: 500 }
        end
    end
end

