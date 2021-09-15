class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image

  validates :title, presence: true, length: { in: 1..10 }
  validates :description, presence: true, length: { in: 1..100 }
  validates :image, presence: true
end
