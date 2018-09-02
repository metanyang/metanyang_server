class Sponsership < ApplicationRecord
  belongs_to :good
  belongs_to :center

  has_many :result_mails

  validates :email, presence: true

  def good_name
    self.good.name
  end

  def as_json(*)
    super.tap do |hash|
      hash[:good_name] = good_name
    end
  end
end
