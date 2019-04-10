class Agenda < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, length: { maximum: 1000 }

  belongs_to :team
  belongs_to :user
  has_many :articles, dependent: :destroy
end
