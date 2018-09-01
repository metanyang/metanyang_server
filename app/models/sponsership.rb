class Sponsership < ApplicationRecord
  belongs_to :good
  belongs_to :center

  has_many :result_mails

  validates :email, presence: true

end
