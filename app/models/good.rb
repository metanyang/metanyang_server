class Good < ApplicationRecord
  has_many :center_goods
  has_many :centers, through: :center_goods
end
