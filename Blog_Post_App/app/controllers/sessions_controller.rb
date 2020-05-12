class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by_email params[:email]
        if user&.authenticate params[:password]
            session[:user_id] = user.id
            flash[:success] = "user logged in"
            redirect_to posts_path
        else
            flash[:warning] = "couldn't log in"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "user logged out"
        redirect_to posts_path
    end
    
end
