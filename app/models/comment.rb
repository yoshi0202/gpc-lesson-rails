class Comment < ApplicationRecord
  belongs_to :post

  validates :detail, presence: true, length: { in: 1..10 }
end
