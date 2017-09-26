class AdminUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_users = AdminUser.new
  end

  def create
    @admin_users = AdminUser.new(admin_user_params)
    if @admin_users.save
      flash[:notice] = 'Another admin user has been added.'
      redirect_to(admin_users_path)
    else
      flash[:notice] = "Sorry, that didn't work."
      render('new')
    end
  end

  def edit
    @admin_users = AdminUser.find(params[:id])
  end

  def update
    @admin_users = AdminUser.find(params[:id])
    if @admin_users.update_attributes(admin_user_params)
      flash[:notice] = 'Admin user has been updated.'
      redirect_to(admin_users_path)
    else
      render('edit')
    end
  end

  def delete
    @admin_users = AdminUser.find(params[:id])
  end

  def destroy
    @admin_users = AdminUser.find(params[:id])
    @admin_users.destroy
    flash[:notice] = 'An admin user was deleted.'
    redirect_to(admin_users_path)
  end

  private

  def admin_user_params
    # Permit :password, but NOT :password_digest
    params.require(:admin_user).permit(
      :first_name,
      :last_name,
      :email,
      :username,
      :password,
    )
  end
end
