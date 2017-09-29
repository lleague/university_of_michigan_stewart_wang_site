class PublicationsController < ApplicationController

  layout 'admin'
  before_action :confirm_logged_in
  def index
    @publications = Publication.sorted
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def new
    @publications = Publication.new({:name => ''})
  end

  def create

    # Instantiate a new object using form parameters
    @publications = Publication.new(publication_params)

    # Save the object
    if @publications.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@publications.name}' was added!"
      redirect_to(publications_path)
    else
    # If save fails, redisplay the form so user can fix problems
    render('new')
    end
  end

  def edit
    @publications = Publication.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @publications = Publication.find(params[:id])
    # Update the object
    if @publications.update_attributes(publication_params)
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@publications.name}' was updated!"
      redirect_to(publications_path(@publications))
    else
    # If save fails, redisplay the form so user can fix problems
    render('edit')
    end
  end

  def delete
    @publications = Publication.find(params[:id])
  end

  def destroy
    @publications = Publication.find(params[:id])
    @publications.destroy
    flash[:notice] = "'#{@publications.name}' has been deleted."
    redirect_to(publications_path)
  end

  private

  def publication_params
    params.require(:publication).permit(:publication_id, :name, :year_published, :month_published, :day_published, :citation, :source, :abstract, :first_author, :last_author, :author_ids => [], :journal_ids => [])
  end

end
