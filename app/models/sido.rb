require 'net/http'
require 'nokogiri'

class Sido < ApplicationRecord
  def self.get_sidos
    uri = URI.parse('http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/sido')
    params = { ServiceKey: ENV['OPENAPI_SECRET_KEY'] }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    data = res.body

    xml = Nokogiri::XML(data)
    sidos = xml.xpath("//item").map do |item|
      { sido_id: item.xpath("orgCd").text, name: item.xpath("orgdownNm").text }
    end

    self.create(sidos)
  end
end
