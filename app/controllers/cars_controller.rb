class CarsController < ApplicationController
    def create
        car = Car.create(user: current_user, make: params[:make], model: params[:model], style: params[:style], year: params[:year], trim: params[:trim], VIN: params[:VIN], seats: params[:seats], mileage: params[:mileage], color: params[:color])
        if car.valid?
            flash[:success] = ["New car added!!"]
            redirect_to "/users/profile/#{session[:user_id]}"
        else
            flash[:error] = car.errors.full_messages
            redirect_to "/cars/create"
        end
    end

    def show
        @car = Car.find(params[:id])
        render "/cars/show.html.erb"
    end

    def update
        car = Car.find(params[:id])
        car.make = params[:make]
        car.model = params[:model]
        car.year = params[:year]
        car.trim = params[:trim]
        car.style = params[:style]
        car.seats = params[:seats]
        car.mileage = params[:mileage]
        car.color = params[:color]
        if car.save
            flash[:success] = ["Car information successfully updated!!"]
            redirect_to "/users/profile/#{current_user.id}"
        else
            flash[:error] = car.errors.full_messages
            redirect_to "/users/profile/#{current_user.id}"
        end
    end
end
