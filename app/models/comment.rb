class Comment < ApplicationRecord
  validates :content, length:  { maximum: 1000 }

  belongs_to :article
  belongs_to :user
  validates :content, presence: true
end
