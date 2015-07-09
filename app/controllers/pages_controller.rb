class PagesController < ApplicationController
  def home
  end
  def about
  end
  def delivery
  end
  def contacts
  end


  def sitemap
    @url        = "http://fitohoney.ru"
    @products = Product.all
    @feedbacks = Feedback.all
    @posts = Post.all
  end
end
