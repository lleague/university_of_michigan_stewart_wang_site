class PublicController < ApplicationController

  layout 'public'

  def index
    # intro text
    @publications = Publication.sorted
    @news_article = NewsArticle.sorted
  end

  def team
    @team_members = TeamMember.sorted
  end

  def advisory_council
    @team_members = TeamMember.sorted
  end

  def publications
    @publications = Publication.sorted
  end

  def ramp
    @ramp_pages = RampPage.sorted
  end

  def show
    @ramp_page = RampPage.find(params[:id])
  end

  def icam
    @next_case_review = NextCaseReview.sorted
  end



end
