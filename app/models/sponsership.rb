class Sponsership < ApplicationRecord
  belongs_to :good
  belongs_to :center

  has_one :result_mail

  validates :email, presence: true

end
