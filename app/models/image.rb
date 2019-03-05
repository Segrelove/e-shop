class Image < ApplicationRecord
  belongs_to :property

  validates :url, presence: true
end
