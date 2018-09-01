class CentersController < ApplicationController
  before_action :set_center, only: [:show]
  # 업체 목록 api
  def index
    good_id = params[:good_id]
    center_ids = CenterGood.where(good_id: good_id).pluck("center_id")

    if good_id.present?
      @centers = Center.where(id: center_ids).not(address: nil)
      render json: @centers, status: :ok
    else
      @centers = Center.where.not(address: nil)
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

end
