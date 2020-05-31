class UsersController < ApplicationController
       def index
         @users = User.all
         render json: @users
       end

       def create
        @user = User.create(user_params)
          if @user.valid?
            render json:{ user: UserSerializer.new(@user) },
            status: :created
          else
            render json: { error: 'Failed to create user'},
              status: :not_acceptable
          end
       end

       private
       def user_params
        params.require(:user).permit(:id, :first_name, :last_name, :email, :password, :address, :city, :state, :zip_code, :country, :latitude, :longitude, :phone_number, :avatar_url)
       end
end