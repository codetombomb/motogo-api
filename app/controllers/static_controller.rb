class StaticController < ApplicationController
    def home
        render json: { users: User.all, bikes: Bike.all }
    end
end