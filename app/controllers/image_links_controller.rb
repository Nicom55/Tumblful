class ImageLinksController < ApplicationController

  def index
    # this gets an array of all ImageLinks from the database, and
    # sticks them in an instance variable @image_links
    @image_links = ImageLink.all
  end
  
  #HTTP verb: imange_link GET
  #Example Path: /image_links/:id/(.:format)
  def show
    @image_link = ImageLink.find(params[:id])
  end
  
  #HTTP verb: new_image_link GET
  #Example Path: /image_links/new(.:format)
  
  #testing and playing around with new
  def new
    @image_link = ImageLink.new
  end
  
  #HTTP verb: edit_image_link GET
  #Example Path: /image_links/:id/edit(.:format)
  def edit
    @image_link = ImageLink.find(params[:id])
  end
  
  #HTTP verb: POST
  #Example Path: /image_links(.:format)
  def create
    @image_link = ImageLink.new(url: params[:image_link][:url], title: params[:image_link][:title])
    if @image_link.save
      redirect_to :index
    else
      @errors = @image_link.errors
      render :new
    end
  end
  
  #HTTP verb: PATCH
  #Example Path: /image_links/:id(.:format)
  def update
    @image_link = ImageLink.find(params[:id])
    if @image_link.update(image_link_params)
      redirect_to :index
    else
      @errors = @image_link.errors
      render :edit
    end
  end
  
  #HTTP verb: DELETE
  #Example Path: /image_links/:id(.:format)
  def delete
    @image_link = ImageLink.find(params[:id])
    @image_link.destroy
    redirect_to :index
  end
  
    private   
    def image_link_params
      params.require(:image_link).permit(:url, :title)
    end
end