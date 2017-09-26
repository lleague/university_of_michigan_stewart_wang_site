class AccessController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  def menu
    # display text & links
    @username = session[:username]
    @first_name = session[:first_name]
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      session[:first_name] = authorized_user.first_name
      flash[:notice] = "You are now logged in!"
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Sorry, that username/password combination didn't work."
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    session[:first_name] = nil
    flash[:notice] = 'You are now logged out.'
    redirect_to(access_login_path)
  end


end
