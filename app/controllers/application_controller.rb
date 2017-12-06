class ApplicationController < ActionController::Base
  before_filter :block_foreign_hosts

  def whitelisted?(ip)
    return true if ['10.122.16.0/27', '10.16.0.0/12', '10.17.0.0/16', '10.20.0.0/16', '10.21.0.0/16', '10.41.0.0/23', '10.41.128.0/23', '10.41.130.0/23', '10.41.2.0/23', '10.51.0.0/16', '10.60.0.0/16', '10.70.0.0/16', '10.70.29.0/24', '141.214.0.0/16', '141.216.76.0/24', '172.17.0.0/16', '172.20.0.0/16', '172.22.0.0/16', '172.24.0.0/16', '172.25.0.0/16', '10.42.0.0/20', '10.42.128.0/20'].include?(ip)
    false
  end

  protect_from_forgery with: :exception
  #include SslRequirement
  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(access_login_path)
      # redirect_to prevents requested action from running
    end
  end
end
