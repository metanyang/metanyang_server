class SponsershipsController < ApplicationController
  before_action :set_sponsership, only: [:update]

  def create
    sponser_hash = {}
    sponser_hash[:name] = params[:name]
    sponser_hash[:email] = params[:email]
    sponser_hash[:good_id] = params[:good_id]
    sponser_hash[:center_id] = params[:center_id]
    sponser_hash[:s_count] = params[:s_count]
    sponser_hash[:s_weight] = params[:s_weight]

    @sponsership = Sponsership.new(sponser_hash)

    if @sponsership.save
      render json: @sponsership, status: :ok
    else
      if @sponsership.errors.present?
        render json: {errors: @sponsership.errors.full_messages}, status: :bad_request
      else
        render json: {errors: 'Internal Server Error'}, status: :internal_server_error
      end
    end
  end

  def update
    if @sponsership.update(received_at: Time.now)
      render json: @sponsership, status: :ok
    else
      if @sponsership.errors.present?
        render json: {errors: @sponsership.errors.full_messages}, status: :bad_request
      else
        render json: {errors: 'Internal Server Error'}, status: :internal_server_error
      end
    end
  end

  private

  def set_sponsership
    @sponsership = Sponsership.find(params[:id])
  end
end
