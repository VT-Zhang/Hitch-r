class CarsController < ApplicationController
    def create
        car = Car.create(user: current_user, make: params[:make], model: params[:model], year: params[:year], trim: params[:trim], VIN: params[:VIN], seats: params[:seats], mileage: params[:mileage], color: params[:color])
        if car.valid?
            flash[:success] = ["New car added!!"]
            redirect_to "/users/profile/#{session[:user_id]}"
        else
            flash[:error] = car.errors.full_messages
            redirect_to "/cars/create"
        end
    end
end
