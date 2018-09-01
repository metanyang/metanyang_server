class Cat < ApplicationRecord
  belongs_to :center

  def self.get_cats(center)
    uri = URI.parse('http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic')
    params = {
      upkind: 422400,
      care_reg_no: center[:center_id],
      state: 'notice',
      ServiceKey: 'EYxYSI6yr6DL73ySWR/gwiqhhCWLtgD7vzKMEo2WJK4ZtziJlBAXuxMKhVMEHEtDbYG/0wrhx18vb+mqu4gJmQ=='
    }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    data = res.body

    xml = Nokogiri::XML(data)
    items = xml.xpath("//item")

    cats = []
    if !items.empty?
      center.address = items.first.xpath("careAddr").text
      center.phone = items.first.xpath("careTel").text
      center.save

      cats = items.map do |item|
        {
          cat_id: item.xpath("desertionNo").text,
          center_id: center[:id],
          thumbnail_url: item.xpath("filename").text,
          image_url: item.xpath("popfile").text,
        }
      end
    end

    self.create(cats)
  end
end
