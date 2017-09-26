class NextCaseReviewsController < ApplicationController

  layout 'admin'
  before_action :confirm_logged_in

  def index
    @next_case_reviews = NextCaseReview.sorted
  end

  def show
    @next_case_reviews = NextCaseReview.find(params[:id])
  end

  def new
    @next_case_reviews = NextCaseReview.new
  end

  def create
    # Instantiate a new object using form parameters
    @next_case_reviews = NextCaseReview.new(next_case_review_params)
    # Save the object
    if @next_case_reviews.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@next_case_reviews.when}' added successfully."
      redirect_to(next_case_reviews_path)
    else
    # If save fails, redisplay the form so user can fix problems
    render('new')
    end
  end

  def edit
    @next_case_reviews = NextCaseReview.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @next_case_reviews = NextCaseReview.find(params[:id])
    # Update the object
    if @next_case_reviews.update_attributes(next_case_review_params)
    # If save succeeds, redirect to the index action
      flash[:notice] = "Updated successfully."
      redirect_to(next_case_reviews_path(@next_case_reviews))
    else
    # If save fails, redisplay the form so user can fix problems
    render('edit')
    end
  end

  def delete
    @next_case_reviews = NextCaseReview.find(params[:id])
  end

  def destroy
    @next_case_reviews = NextCaseReview.find(params[:id])
    @next_case_reviews.destroy
    flash[:notice] = "This has been deleted successfully."
    redirect_to(next_case_reviews_path)
  end

  private

  def next_case_review_params
    params.require(:next_case_review).permit(:when)
  end

end
