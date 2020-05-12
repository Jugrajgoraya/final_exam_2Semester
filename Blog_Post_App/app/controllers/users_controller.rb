class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new params.require(:user).permit(:first_name, :last_name, :email, :password)
        if @user.save
            flash[:success] = "created new user"
            redirect_to posts_path
        else
            flash[:warning] = "unable to create user"
            render :new
        end
    end

end
