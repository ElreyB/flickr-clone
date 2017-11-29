class ProfilesController < ApplicationController
  def show
    @user = current_user
    @images = @user.images
    # @favorites = Favorites.user_favorites(@user.id)
  end
end
