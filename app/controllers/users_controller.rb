class UsersController < ApplicationController
  def show
    @user = current_user
    @images = @user.images
    @favorites = Image.get_favorites(@user.id)
    @user_images = Image.get_user_images(@user.id)
  end
end
