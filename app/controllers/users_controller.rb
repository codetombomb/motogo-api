class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
       def index
         render json: User.all
       end 

       def show 
        render json: @user
       end
       
       #PUT /users/1
       def update
        # if @user.update(params['user']['id'])
        #   render json: @user
       end

       def destroy
        @user.destroy
       end

       private

       def set_user
        @user = User.find(params[:id])
       end

      # Only allow a trusted parameter "white list" through.
      def user_params
         parmas.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :street, :city, :state, :zip_code, :phone_number, :avatar)
      end


end