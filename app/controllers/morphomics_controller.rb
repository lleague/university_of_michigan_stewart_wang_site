class MorphomicsController < ApplicationController

  def show
    render template: "morphomics/#{params[:morphomics]}"
  end

end
