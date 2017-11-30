class Image < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :favorites

  has_attached_file :photo
  validates :photo, attachment_presence: true
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def self.get_favorites(user_id)
    favorite_ids = Favorite.user_favorites(user_id)
    favorites = []
    favorite_ids.each do |favorite|
      favorites.push(Image.find(favorite.image_id))
    end
    favorites
  end
end
