class PictureShooting < ApplicationRecord
  belongs_to :collection
  validates :url, presence: true
end
