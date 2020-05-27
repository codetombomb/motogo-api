class BikesController < ApplicationController

    def index
        @bikes = Bike.all 
        render json: @bikes
    end

    def create
        bike = Bike.create!(
            year: params['bike']['year'],
            make: params['bike']['make'],
            model: params['bike']['model'],
            miles: params['bike']['miles'],
            license_plate: params['bike']['licence_plate'],
            bike_name: params['bike']['bike_name'],
            category: params['bike']['category']
            )
            if bike 
                render json: {
                    status: :created_bike,
                    user: bike
                }
            else
            # byebug
            render json: { status: 500 }
        end
    end

end
