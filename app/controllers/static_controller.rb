class StaticController < ApplicationController
    def home
        users = User.all
        user_bikes = Bike.all
        render json: { users: users, user_bikes: user_bikes  }
    end
end