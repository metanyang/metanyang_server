class GoodsController < ApplicationController
  def index
    @goods = Good.all
    render json: @goods
  end
end
