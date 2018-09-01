require 'net/http'
require 'nokogiri'

class Center < ApplicationRecord
  has_many :center_goods
  has_many :goods, through: :center_goods

  has_many :sponserships

  after_create :set_goods

  def self.auto_gen_center
    name_ary = %w(한국동물구조관리협회 강남25시동물병원 상암동물병원)
    phone_ary = ["031-867-9119", "02-545-8575", "02-375-7222"]
    address_ary = ["경기도 양주시 남면 감악산로 63-37", "서울특별시 강남구 학동로 324 (논현동)", "서울특별시 마포구 월드컵북로 336 (상암동)   상암동34-46"]
    name_ary.each_with_index do |name, index|
      center = self.find_or_create_by(name: name)
      center.update!(phone: phone_ary[index], address: address_ary[index])
    end
  end

  # goods random 접속
  def set_goods
    good_ids = Good.all.ids
    rand_num = [1,2,3].sample
    Good.where(id: good_ids.sample(rand_num)).each do |good|
      center_goods.create(good: good)
    end
  end

  # 이거 안 씀!
  def self.dump_center
    file = File.read('center.json')
    data_hash = JSON.parse(file)
    puts data_hash.class
    self.create(data_hash)
  end

  def self.get_centers
    centers = []
    for page in 1..33
      uri = URI.parse('http://www.animal.go.kr/portal_rnl/map/mapInfo2.jsp')
      params = { pagecnt: page }
      uri.query = URI.encode_www_form(params)

      res = Net::HTTP.get_response(uri)
      data = res.body.bytes.pack('c*').force_encoding('euc-kr').encode('utf-8')

      html = Nokogiri::HTML(data)
      html.css('tbody').css('tr').each do |tr|
        columns = tr.css('td')

        if columns.length == 4
          centers.push({
            name: columns[1].text,
            phone: columns[2].text,
            address: columns[3].text.gsub(/\t|\n/, '').squish
          })
        end
      end
    end

    self.create(centers)
  end
end
