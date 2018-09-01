class Center < ApplicationRecord
  has_many :center_goods
  has_many :goods, through: :center_goods

  has_many :sponserships

  def self.auto_gen_center
    name_ary = %w(한국동물구조관리협회 강남25시동물병원 상암동물병원)
    phone_ary = ["031-867-9119", "02-545-8575", "02-375-7222"]
    address_ary = ["경기도 양주시 남면 감악산로 63-37", "서울특별시 강남구 학동로 324 (논현동)", "서울특별시 마포구 월드컵북로 336 (상암동)   상암동34-46"]
    name_ary.each_with_index do |name, index|
      center = self.find_or_create_by(name: name)
      center.update!(phone: phone_ary[index], address: address_ary[index])
      Good.all.each do |g|
        center.center_goods.create(good: g)
      end
    end
  end
end
