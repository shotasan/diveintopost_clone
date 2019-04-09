class Agenda < ApplicationRecord
  validates :title, presence: true

  belongs_to :team
  belongs_to :user
  has_many :articles, dependent: :destroy
end
