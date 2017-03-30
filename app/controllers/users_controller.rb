class UsersController < ApplicationController
    def create
        user = User.create(f_name: params[:f_name], l_name: params[:l_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], street_num: params[:street_num], street: params[:street], city: params[:city], state: params[:state], zipCode: params[:zipCode], phone: params[:phone], bday: params[:bday])
        if user.valid?
            session[:user_id] = user.id
            flash[:success] = ["New user successfully created!!"]
            redirect_to "/users/profile/#{session[:user_id]}"
        else
            flash[:error] = user.errors.full_messages
            redirect_to "/"
        end
    end

    def show
        render "/users/show.html.erb"
    end

    def update
        user = current_user
        user.f_name = params[:f_name]
        user.l_name = params[:l_name]
        user.email = params[:email]
        user.street_num = params[:street_num]
        user.street = params[:street]
        user.city = params[:city]
        user.state = params[:state]
        user.zipCode = params[:zipCode]
        user.phone = params[:phone]
        user.bday = params[:bday]
        if user.save
            flash[:success] = ["Changes saved!"]
            redirect_to "/users/profile/#{session[:user_id]}"
        else
            flash[:error] = user.errors.full_messages
            redirect_to "/users/edit/#{session[:user_id]}"
        end
    end
end
