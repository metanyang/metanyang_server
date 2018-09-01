require 'net/http'
require 'nokogiri'

class Sigungu < ApplicationRecord
  belongs_to :sido

  def self.get_sigungus(sido)
    uri = URI.parse('http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sigungu')
    params = {
      upr_cd: sido[:sido_id],
      ServiceKey: 'EYxYSI6yr6DL73ySWR/gwiqhhCWLtgD7vzKMEo2WJK4ZtziJlBAXuxMKhVMEHEtDbYG/0wrhx18vb+mqu4gJmQ=='
    }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    data = res.body

    xml = Nokogiri::XML(data)
    items = xml.xpath("//item")

    if items.empty?
      sigungus = [{ sigungu_id: sido[:sido_id], sido_id: sido[:sido_id], name: sido[:name] }]
    else
      sigungus = xml.xpath("//item").map do |item|
        { sigungu_id: item.xpath("orgCd").text, sido_id: sido[:id], name: item.xpath("orgdownNm").text }
      end
    end

    self.create(sigungus)
  end
end
