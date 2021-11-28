class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
      @user = User.new(params_mass_assignment)
      if @user.save
        redirect_to root_url, :notice => "Signed up!"
      else
        render "new"
      end
    end

    def params_mass_assignment
      params.require(:user).permit(:email, :first_name, :last_name, :username, :password, :password_confirmation)
    end
end
