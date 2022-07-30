class UsersController < ApplicationController
    # before_action :set_user, only: [:edit, :update]
    before_action :set_user
    # before_action :check_login
    # authorize_resource
    def index
      # finding all the active owners and paginating that list (will_paginate)

    end

    def create
    end

    def edit
        @user.role = "customer" if current_user.role?(:customer)
    end

    def update
        if @user.update_attributes(user_params)
        flash[:notice] = "Successfully updated #{@user.username}."
        redirect_to users_url
        else
        render action: 'edit'
        end
    end

    def new
        @user = User.new
    end

    def show
    
    end

    def destroy
    end

    private
    def set_user
      @user = @current_user
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :active, :username, :role, :password, :password_confirmation)
    end
end