class Image < ActiveRecord::Base
  has_many :comments
  has_many :users, through: :comments
  belongs_to :user
  has_and_belongs_to_many :tags
end
