class UsersController < ApplicationController
    before_action :require_login, except [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def show
        current_user
    end

    private

        def user_params
            params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
        end

        def login
            session[:user_id] = @user.id
        end

        def require_login
            unless logged_in?
                flash[:error] = "You must be logged in to access this section"
                redirect_to signin_path
            end
        end
  end

end