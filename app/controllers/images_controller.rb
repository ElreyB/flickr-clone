class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
    @user = current_user
    @image = Image.new
  end

  def create
    @user = current_user
    @image = @user.images.new(image_params)
    if @image.save
      flash[:notice] = "You image has been saved!"
      redirect_to '/'
    else
      flash[:alert] = "Looks like you did it again....."
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
    @user = User.find(@image.user_id)
    @tag = Tag.new
  end

  def destroy
    @image.find(params[:id])
    @image.destroy
    flash[:notice] = "Your image has been deleted."
    redirect_to '/'
  end

private
  def image_params
    params.require(:image).permit(:photo, :title, :user_id)
  end
end
