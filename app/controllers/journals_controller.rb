class JournalsController < ApplicationController

  layout 'admin'
  before_action :confirm_logged_in

  def index
    @journals = Journal.sorted
  end

  def show
    @journals = Journal.find(params[:id])
  end

  def new
    @journals = Journal.new({:name => ''})
  end

  def create

    # Instantiate a new object using form parameters
    @journals = Journal.new(journal_params)

    # Save the object
    if @journals.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@journals.name}' was added!"
      redirect_to(journals_path)
    else
    # If save fails, redisplay the form so user can fix problems
    render('new')
    end
  end

  def edit
    @journals = Journal.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @journals = Journal.find(params[:id])
    # Update the object
    if @journals.update_attributes(journal_params)
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@journals.name}' was updated!"
      redirect_to(journals_path(@journals))
    else
    # If save fails, redisplay the form so user can fix problems
    render('edit')
    end
  end

  def delete
    @journals = Journal.find(params[:id])
  end

  def destroy
    @journals = Journal.find(params[:id])
    @journals.destroy
    flash[:notice] = "'#{@journals.name}' has been deleted."
    redirect_to(journals_path)
  end

  private

  def journal_params
    params.require(:journal).permit(:journal_id, :name)
  end
  end
