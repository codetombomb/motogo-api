class RegistrationsController < ApplicationController
    def create
        user = User.create!(
            first_name: params['user']['first_name'],
            last_name: params['user']['last_name'],
            email: params['user']['email'],
            password: params['user']['password'],
            password_confirmation: params['user']['password_confirmation'],
            address: params['user']['address'],
            city: params['user']['city'],
            state: params['user']['state'],
            zip_code: params['user']['zip_code'],
            phone_number: params['user']['phone_number']

        )
        if user
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


t.string "first_name"
t.string "last_name"
t.string "email"
t.string "password_digest"
t.string "address"
t.string "city"
t.string "state"
t.string "zip_code"
t.string "phone_number"