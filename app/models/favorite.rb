class Favorite < ActiveRecord::Base
  belongs_to :image
  belongs_to :user

  scope :user_favorites, ->(user_id){ where("user_id = ? ", user_id) }
end
