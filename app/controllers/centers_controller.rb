class CentersController < ApplicationController
  before_action :set_center, only: [:show]
  # 업체 목록 api
  def index
    good_id = params[:good_id]
    center_ids = CenterGood.where(good_id: good_id).pluck("center_id")

    @centers = Center.all_available(center_ids).sort { |c1, c2| c1.num_cats <=> c2.num_cats }
    render json: @centers, status: :ok

  end

  def show
    @sponserships = @center.sponserships
    render json: @sponserships, status: :ok
  end



  private
  def set_center
    @center = Center.find(params[:id])
  end

end
