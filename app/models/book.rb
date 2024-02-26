class Book < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :opinion, presence: true
end
