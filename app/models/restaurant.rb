class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :address, :category, presence: true
  validates :category, format: { with: /chinese|italian|japanese|french|belgian/i,
                                 message: "must be Chinese, Italian, Japanese, French, or Belgian" }
end
