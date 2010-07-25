module Spy
  class UsersController < ApplicationController

    unloadable

    skip_before_filter :verify_authenticity_token, :only => :user_switcher

    def user_switcher
      user = User.find(params[:user_id])
      warden.session.clear if warden.authenticated?
      warden.set_user(user)
      redirect_to '/'
    end

    def sign_in_admin
      if current_user.is_admin?
        flash[:notice] = t 'spy.sessions.admin.signed_in'
        # store current user who has admin authorization into admin scope
        warden.set_user(current_user, :scope => Spy.admin_scope)
        warden.session[Spy.admin_scope] = warden.session
      end
      redirect_to '/'
    end

    def sign_out_admin
      warden.logout # logs out all scopes
      flash[:notice] = t 'spy.sessions.admin.signed_out'
      redirect_to '/'
    end

    protected

    def warden
      request.env['warden']
    end

  end
end
