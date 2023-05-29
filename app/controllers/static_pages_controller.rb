class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about 
  end

  def contact 
  end
  def indexLogin
    render 'static_pages/login'
  end
end
