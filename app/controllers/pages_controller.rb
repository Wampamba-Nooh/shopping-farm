class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  before_action :set_page, only: [:show]

  def news
  end
  def distributors
  end
  def products
  end
  def products2
  end
  def show

  end
  def about
  end
  def contacts
  end
  

  def test
    #render layout: false
  end
private
  def set_page
    @page = Page.find(params[:id])
  end

end
