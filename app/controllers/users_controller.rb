class UsersController < ApplicationController
    def create
        user = User.create(f_name: params[:f_name], l_name: params[:l_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], street_num: params[:street_num], street: params[:street], city: params[:city], state: params[:state], zipCode: params[:zipCode], phone: params[:phone], bday: params[:bday])
        if user.valid?
            session[:user_id] = user.id
            flash[:success] = ["New user successfully created!!"]
            redirect_to "/"
        else
            flash[:error] = user.errors.full_messages
            redirect_to "/"
        end
    end
end
