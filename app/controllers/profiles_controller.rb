class ProfilesController < ApplicationController
  def show
    @user = current_user
    @images = @user.images
    @favorites = Image.get_favorites(@user.id)
  end
end
