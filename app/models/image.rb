class Image < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :favorites

  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
