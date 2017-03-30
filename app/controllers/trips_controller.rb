class TripsController < ApplicationController
    def create
        car = Car.find(params[:car_id])
        trip = Trip.create(user: current_user, dStreetNum: params[:dStreetNum], dStreet: params[:dStreet], dCity: params[:dCity], dState: params[:dState], dZip: params[:dZip], aStreetNum: params[:aStreetNum], aStreet: params[:aStreet], aCity: params[:aCity], aState: params[:aState], aZip: params[:aZip], dDate: params[:dDate], aDate: params[:aDate], price: params:[price], car: car)
        if trip.valid?
            flash[:success] = ["New trip created!"]
            redirect_to "/users/profile/#{session[:user_id]}"
        else
            flash[:error] = trip.errors.full_messages
            redirect_to "/users/profile/#{session[:user_id]}"
        end
    end

    def show
        @trip = Trip.find(params[:id])
        render "/trips/show.html.erb"
    end
end
