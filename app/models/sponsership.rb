class Sponsership < ApplicationRecord
  belongs_to :good
  belongs_to :center, optional: true

  validates :email, presence: true
end
