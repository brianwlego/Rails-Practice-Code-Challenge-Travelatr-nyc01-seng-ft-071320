class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :like]
  
  def new
    @post = Post.new


  end
  def create
    @post = Post.create(post_params)
    # @blogger = Blogger.create(post_params[:blogger_attributes])
    # @blogger.posts.create(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      flash[:my_errors] = @post.errors.full_messages
      redirect_to new_post_path
    end

  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      flash[:my_errors] = @post.errors.full_messages
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post.destroy
    redirect_to new_post_path
  end

  def like
    @post.add_like
    @post.save
    redirect_to post_path(@post)
  end 



  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :destination_id, blogger_attributes: [:name, :bio, :age] )
  end 

end