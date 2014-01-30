class PagesController < ApplicationController
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
    render layout: "contacts"
  end
  def test
    #render layout: false
  end

end
