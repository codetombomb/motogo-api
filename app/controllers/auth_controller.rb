class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create 
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(user_login_params[:password])
            token = encode_token({ user_id: @user.id })
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else 
            render json: { message: "The input you entered was invalid. Please try again" }, status: :unauthorized
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:email, :password)
    end
end