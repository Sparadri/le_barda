class PictureInterview < ApplicationRecord

  belongs_to :collection
  validates :url, presence: true

  mount_uploader :url, PictureUploader
end
