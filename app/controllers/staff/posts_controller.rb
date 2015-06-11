class Staff::PostsController < Staff::StaffController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_post_path

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to staff_posts_path, notice: 'Публикация успешно создана!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to staff_post_path(@post), notice: 'Публикация успешно обновлена!' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to staff_posts_url, notice: 'Публикация успешно удалена!' }
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :prev, :body, :photo)
  end
  def set_post
    @post = Post.find(params[:id])
  end
  def set_post_path
    @posts_path = true
  end
end
