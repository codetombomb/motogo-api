class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

       def index
         @users = User.all
         render json: @users
       end

       def create
        @user = User.create(user_params)
          if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json:{ user: UserSerializer.new(@user), jwt: token },
            status: :created
          else
            render json: { error: 'Failed to create user'}, 
            status: :not_acceptable
          end
       end

       def profile
        render json: { user: current_user }
       end

       private

       def user_params
        params.require(:user).permit(:id, :first_name, :last_name, :email, :password, :address, :city, :state, :zip_code, :country, :lat, :lon, :phone_number, :avatar_url)
       end
       
end