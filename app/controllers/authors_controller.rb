class AuthorsController < ApplicationController

  layout 'admin'
  before_action :confirm_logged_in
  def index
    @authors = Author.sorted
  end

  def show
    @authors = Author.find(params[:id])
  end

  def new
    @authors = Author.new
  end

  def create
    # Instantiate a new object using form parameters
    @authors = Author.new(author_params)
    # Save the object
    if @authors.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@authors.name}' was added!"
      redirect_to(authors_path)
    else
    # If save fails, redisplay the form so user can fix problems
    render('new')
    end
  end

  def edit
    @authors = Author.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @authors = Author.find(params[:id])
    # Update the object
    if @authors.update_attributes(author_params)
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@authors.name}' was updated!"
      redirect_to(authors_path(@authors))
    else
    # If save fails, redisplay the form so user can fix problems
    render('edit')
    end
  end

  def delete
    @authors = Author.find(params[:id])
  end

  def destroy
    @authors = Author.find(params[:id])
    @authors.destroy
    flash[:notice] = "'#{@authors.name}' was deleted."
    redirect_to(authors_path)
  end

  private

  def author_params
    params.require(:author).permit(:author_id, :name)
  end

end
