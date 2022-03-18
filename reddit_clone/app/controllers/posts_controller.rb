class PostsController < ApplicationController

  before_action :is_author?, only: [:edit, :update]

  def new
    @post = Post.new
    render :new
  end

  def create
    debugger
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def is_author?
    @post =  Post.find(params[:id])
    redirect_to post_url(params[:id]) unless @post.author == current_user
  end


  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :author_id, :sub_ids => [])
  end

end
