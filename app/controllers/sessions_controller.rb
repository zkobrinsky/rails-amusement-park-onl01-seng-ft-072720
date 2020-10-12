class SessionsController < ApplicationController
    # before_action :require_login

    def new
        @user = User.new
    end

    def create
        if @user = User.find_by_id(params[:user][:id])
            if @user.validate(params[:user][:password])
                byebug
                session[:user_id] = @user.id
            end
        else
            #do something
        end
    end

    private

        def require_login

        end
end