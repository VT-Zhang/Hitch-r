class SessionsController < ApplicationController
    def index
        session[:user_id] = nil
        
    end

    def create
        user = User.find_by(email: params[:email])
        if user
            if user.authenticate(params[:password])
                session[:user_id] = user.id
                flash[:success] = ["User successfully logged in!"]
                redirect_to "/users/profile/#{session[:user_id]}"
            else
                flash[:error] = ["Sorry, that password is invalid"]
                redirect_to "/"
            end
        else
            flash[:error] = ["That email does not exist! Create an account?"]
            redirect_to "/"
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:error] = nil
        flash[:success] = ["Successfully logged out!!"]
        redirect_to "/"
    end
end
