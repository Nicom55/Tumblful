class TextPostsController < ApplicationController

  #GET
  def index
    p TextPost.all
    @text_posts = TextPost.all || []
  end
  
  #GET
  def new
    @text_post = TextPost.new
  end
  
  #POST
  def create
    @text_post = TextPost.new(text_post_params)
    if @text_post.save
      redirect_to action: 'index'
    else
      @errors = @text_post.errors
      render :new
    end
  end
  
  #GET  
  def show
    @text_post = TextPost.find(params[:id])
  end
  
  #GET  
  def edit
    @text_post = TextPost.find(params[:id])
  end
  
  #PATCH and PUT  
  def update
    @text_post = TextPost.find(params[:id])
    if @text_post.update(text_post_params)
      redirect_to :index
    end
  end
  
  #DELETE  
  def delete
    @text_post = TextPost.find(params[:id])
    @text_post.destroy
    redirect_to :index
  end
    
  private
    def text_post_params
      params.require(:text_post).permit(:url, :title)
    end
end
