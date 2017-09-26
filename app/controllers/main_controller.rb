class MainController < ApplicationController

  layout false

  def index
    render('index')
  end

  def ramp
    render('ramp')
  end

end
