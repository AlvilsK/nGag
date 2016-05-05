class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @posts = Post.all.order("created_at DESC")
  end
  
  def show
  end
  
  def new
      @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    @post.category_id = params[:category_id]
    if @post.save
      redirect_to root_path, notice: "You have successfully added a post!"
    else
      render 'new', notice: "There was a problem, please try again."
    end
  end

  def update
		@post.category_id = params[:category_id]
		if @post.update(post_params)
			redirect_to root_path(@post)
		else
			render 'edit'
		end
  end
  
  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end
  
  def destroy
    @post.destroy
    redirect_to root_path, warning: "You have deleted your post"
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :post_img, :description, :category_id, :created_at, :email, :comment)
  end
  
  def find_post
    @post = Post.find(params[:id])
  end

end
