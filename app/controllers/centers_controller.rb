class CentersController < ApplicationController
  # 업체 목록 api
  def index
    good_id = params[:good_id]
    center_ids = CenterGood.where(good_id: good_id).pluck("center_id")

    if good_id.present?
      @centers = Center.where(id: center_ids)
      render json: @centers, status: :ok
    else
      @centers = Center.all
      render json: @centers, status: :ok
    end

  end

  def show
    center = Center.find(params[:id])
    render json: {errors: "no id"}, status: :bad_request unless center.present?
    @sponserships = center.sponserships
    render json: @sponserships, status: :ok

  end
end
