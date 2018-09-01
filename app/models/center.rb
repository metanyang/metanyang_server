require 'net/http'
require 'nokogiri'

class Center < ApplicationRecord
  has_many :center_goods
  has_many :goods, through: :center_goods

  has_many :sponserships
  has_many :cats

  after_create :set_goods

  # goods random 접속
  def set_goods
    good_ids = Good.all.ids
    rand_num = [1,2,3].sample
    Good.where(id: good_ids.sample(rand_num)).each do |good|
      center_goods.create(good: good)
    end
  end

  def good_names
    self.goods.map { |good| good.name }
  end

  def num_cats
    self.cats.length
  end

  def self.all_available(center_ids)
    if center_ids.any?
      self.includes(:cats).where(id: center_ids).where.not(address: nil)
    else
      self.includes(:cats).where.not(address: nil)
    end
  end

  def as_json(*)
    super.tap do |hash|
      hash[:num_cats] = num_cats
      hash[:good_names] = good_names
    end
  end

  def self.get_centers(sido, sigungu)
    uri = URI.parse('http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/shelter')
    params = {
      upr_cd: sido[:sido_id],
      org_cd: sigungu[:sigungu_id],
      ServiceKey: ENV['OPENAPI_SECRET_KEY']
    }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    data = res.body

    xml = Nokogiri::XML(data)
    centers = xml.xpath("//item").map do |item|
      { center_id: item.xpath("careRegNo").text, name: item.xpath("careNm").text }
    end

    self.create(centers)
  end
end
