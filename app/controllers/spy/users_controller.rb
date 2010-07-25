module Spy
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
        flash[:notice] = t 'spy.sessions.admin.signed_in'
        sign_in Spy.admin_scope, current_user
      end
      redirect_to '/'
    end

    def sign_out_admin
      sign_out Spy.admin_scope
      flash[:notice] = t 'spy.sessions.admin.signed_out'
      redirect_to '/'
    end

    protected

    def warden
      request.env['warden']
    end

    def sign_in(scope, resource)
      warden.set_user(resource, :scope => scope)
    end

    def sign_out(scope)
      warden.session.clear
      warden.logout(scope)
    end
  end
end
