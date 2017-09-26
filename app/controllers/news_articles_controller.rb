class NewsArticlesController < ApplicationController

  layout 'admin'
  before_action :confirm_logged_in

  def index
    @news_articles = NewsArticle.sorted
  end

  def show
    @news_articles = NewsArticle.find(params[:id])
  end

  def new
    @news_articles = NewsArticle.new
  end

  def create
    # Instantiate a new object using form parameters
    @news_articles = NewsArticle.new(news_article_params)
    # Save the object
    if @news_articles.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@news_articles.title}' was added."
      redirect_to(news_articles_path)
    else
    # If save fails, redisplay the form so user can fix problems
    render('new')
    end
  end

  def edit
    @news_articles = NewsArticle.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @news_articles = NewsArticle.find(params[:id])
    # Update the object
    if @news_articles.update_attributes(news_article_params)
    # If save succeeds, redirect to the index action
      flash[:notice] = "'#{@news_articles.title}' has been updated."
      redirect_to(news_articles_path(@news_articles))
    else
    # If save fails, redisplay the form so user can fix problems
    render('edit')
    end
  end

  def delete
    @news_articles = NewsArticle.find(params[:id])
  end

  def destroy
    @news_articles = NewsArticle.find(params[:id])
    @news_articles.destroy
    flash[:notice] = "#{@news_articles.title}' has been deleted."
    redirect_to(news_articles_path)
  end

  private

  def news_article_params
    params.require(:news_article).permit(:title, :content, :source, :image)
  end
end
