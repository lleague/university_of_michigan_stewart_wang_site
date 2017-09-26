class TeamMembersController < ApplicationController

  layout 'admin'
  before_action :confirm_logged_in

  def index
    @team_members = TeamMember.sorted
  end

  def show
    @team_members = TeamMember.find(params[:id])
  end

  def new
    @team_members = TeamMember.new
  end

  def create
    # Instantiate a new object using form parameters
    @team_members = TeamMember.create(team_member_params)
    # Save the object
    if @team_members.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@team_members.first_name}' was added."
      redirect_to(team_members_path)
    else
    # If save fails, redisplay the form so user can fix problems
    render('new')
    end
  end

  def edit
    @team_members = TeamMember.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @team_members = TeamMember.find(params[:id])
    # Update the object
    if @team_members.update_attributes(team_member_params)
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@team_members.first_name}' has been updated."
      redirect_to(team_members_path(@team_members))
    else
    # If save fails, redisplay the form so user can fix problems
    render('edit')
    end
  end

  def delete
    @team_members = TeamMember.find(params[:id])
  end

  def destroy
    @team_members = TeamMember.find(params[:id])
    @team_members.destroy
    flash[:notice] = "#{@team_members.first_name}' has been deleted."
    redirect_to(team_members_path)
  end

  private

  def team_member_params
    params.require(:team_member).permit(:team_member_id, :last_name, :first_name, :degree, :title, :headshot, :bio, :team_member_type, :image)
  end
end
