class Sponsership < ApplicationRecord
  belongs_to :good
  belongs_to :center

  validates :email, presence: true

end
