require 'net/http'
require 'nokogiri'

class CentersController < ApplicationController
  before_action :set_center, only: [:show]
  # 업체 목록 api
  def index
    good_id = params[:good_id]
    center_ids = CenterGood.where(good_id: good_id).pluck("center_id")

    get_centers

    if good_id.present?
      @centers = Center.where(id: center_ids)
      render json: @centers, status: :ok
    else
      @centers = Center.all
      render json: @centers, status: :ok
    end

  end

  def show
    @sponserships = @center.sponserships
    render json: @sponserships, status: :ok
  end



  private
  def set_center
    @center = Center.find(params[:id])
  end

  def get_centers
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

    centers
  end
end
