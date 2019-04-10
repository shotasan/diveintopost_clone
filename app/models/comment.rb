class Comment < ApplicationRecord
  validates length: { maximum: 1000 }

  belongs_to :article
  belongs_to :user
  validates :content, presence: true
end
