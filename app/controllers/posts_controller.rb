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




# create_table "bikes", force: :cascade do |t|
#     t.integer "owner_id"
#     t.integer "year"
#     t.string "make"
#     t.string "model"
#     t.integer "miles"
#     t.string "license_plate"
#     t.integer "rating"
#     t.string "bike_name"
#     t.string "category"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end
