class PostsController < ApplicationController
  
  def index
    @posts = Post.asc(:updated_at).page(params[:page])
  end
  
  def show
    @post = Post.find_by(path: params[:id])
  end
  
  def feed
    @posts=Post.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
end
