class RegistrationsController < ApplicationController
    def create
        # byebug
        user = User.create!( 
            first_name: params['user']['first_name'],
            last_name: params['user']['last_name'],
            email: params['user']['email'],
            password: params['user']['password'],
            password_confirmation: params['user']['password_confirmation'],
            address: params['user']['street'],
            city: params['user']['city'],
            state: params['user']['state'],
            zip_code: params['user']['zip_code'],
            phone_number: params['user']['phone_number'],
            ip_address: params['user']['ip_address'],
            avatar_url: params['user']['avatar_url']
        )
        if user
            Renter.create(user_id: user.id)
            Owner.create(user_id: user.id)
            # user.avatar.attach(
            #     io: File.open("http://localhost:3001/#{params['avatar']["filename"]}"),
            #     filename: params['avatar']['filename'],
            #     content_type: params['avatar']['content_type']
            # )
            session[:user_id] = user.id 
            render json: {
                status: :created,
                user: user
            }
        else 
            render json: { status: 500 }
        end
    end
end

