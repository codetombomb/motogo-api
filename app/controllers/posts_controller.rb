class PostsController < ApplicationController

    def index
        # @posts = Post.all
        @posts = []
        # byebug
        Post.all.map do |post|
            if !RenterPost.find_by(post_id: post.id)
                @posts << post
            end
        end 
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
        if @bike
            @post = Post.create(
                owner_id: @owner.id,
                bike_id: @bike.id,
                price_per_day: params['bike']['cost_per_day'],
                description: params['bike']['description']
            )
            if @post
                render json: @post
            else
                render json: { status: 500, error: "Could not create Post instance so bike info or user info is incorrect. Could also be that my logic is not right..."}
            end
        else
            render json: { status: 500 }
        end
    end
end

