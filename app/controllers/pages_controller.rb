class PagesController < ApplicationController
  def home
  end
  def about
  end
  def delivery
  end


  def sitemap
    @url        = "http://fitohoney.ru"
    @products = Product.all
    @feedbacks = Feedback.all
  end
end
