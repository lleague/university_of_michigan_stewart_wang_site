class RampPagesController < ApplicationController

  layout 'admin'


  def show
    @ramp_page = RampPage.find(params[:id])
  end
  
  before_action :confirm_logged_in
  def index
    @ramp_pages = RampPage.sorted
  end



  def new
    @ramp_pages = RampPage.new
  end

  def create
    # Instantiate a new object using form parameters
    @ramp_pages = RampPage.new(ramp_page_params)
    # Save the object
    if @ramp_pages.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@ramp_pages.name}' added successfully."
      redirect_to(ramp_pages_path)
    else
    # If save fails, redisplay the form so user can fix problems
    render('new')
    end
  end

  def edit
    @ramp_pages = RampPage.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @ramp_pages = RampPage.find(params[:id])
    # Update the object
    if @ramp_pages.update_attributes(ramp_page_params)
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@ramp_pages.name}' updated successfully."
      redirect_to(ramp_pages_path(@ramp_pages))
    else
    # If save fails, redisplay the form so user can fix problems
    render('edit')
    end
  end

  def delete
    @ramp_pages = RampPage.find(params[:id])
  end

  def destroy
    @ramp_pages = RampPage.find(params[:id])
    @ramp_pages.destroy
    flash[:notice] = "'#{@ramp_pages.name}' deleted successfully."
    redirect_to(ramp_pages_path)
  end

  private

  def ramp_page_params
    params.require(:ramp_page).permit(:ramp_id, :name, :definition, :chart_img, :scan_img, :m_ages, :m_valsArr2d, :f_ages, :f_valsArr2d, :vertebrae_number)
  end

end
