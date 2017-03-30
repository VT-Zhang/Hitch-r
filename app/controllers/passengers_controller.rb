class PassengersController < ApplicationController
    belongs_to :user
    belongs_to :trip
end
