class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validates :rating, numericality: { only_integer: true }

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_desc_reverse, -> { order(rating: :desc).reverse }

  after_create_commit { CommentUpdateJob.perform_later(self, self.user) }
end
