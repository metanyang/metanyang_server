class CentersController < ApplicationController
  # 업체 목록 api
  def index
    goods = params[:goods]
    if goods.present?
      render json: {status: 1}
    else
      render json: {status: 2}
    end
  end
end
