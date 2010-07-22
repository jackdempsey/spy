module Skitzo
  class UsersController < ApplicationController

    unloadable

    skip_before_filter :verify_authenticity_token, :only => :user_switcher

    def user_switcher
      user = User.find(params[:user_id])
      sign_in :user, user
      redirect_to '/'
    end

    def sign_in_admin
      if current_user.is_admin?
        flash[:notice] = "Signed in as admin"
        sign_in :admin, current_user
      end
      redirect_to '/'
    end

    def sign_out_admin
      sign_out :admin
      flash[:notice] = "Signed out admin"
      redirect_to '/'
    end
  end
end
