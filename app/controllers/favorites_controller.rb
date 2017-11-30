class FavoritesController < ApplicationController

  def new
    @image = Image.find(params[:id])
    @user = current_user
    @favorite = Favorite.new
  end

  def create
    @image = Image.find(params[:image_id])
    @user = current_user
    @favorite = @user.favorites.new
    @favorite.image_id = @image.id
    if @favorite.save
      flash[:notice] = "Image has been added to your favorites!"
      redirect_to image_path(@image)
    else
      flash[:alert] = "Oops! There are errors!"
      render :new
    end
  end

  def destroy
    @favorite = Favorite.find(:image_id)
    @favorite.destroy
    @user = current_user
    flash[:notice] = "Favorite has been removed."
    redirect_to user_path(@user)
  end

private
  def favorite_params
    params.require(:favorite).permit(:user_id, :image_id)
  end
end
