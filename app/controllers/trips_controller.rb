class TripsController < ApplicationController
    def create
        trip = Trip.create()
    end
end
