class Image < ApplicationRecord
  mount_uploader :picture, PictureUploader
  default_scope { order(created_at: :desc)}
  belongs_to :user

  validates :title, presence: true
end
