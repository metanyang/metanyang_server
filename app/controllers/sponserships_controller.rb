class SponsershipsController < ApplicationController
  def create
    sponser_hash = {}
    sponser_hash[:email] = params[:email]
    sponser_hash[:good_id] = params[:good_id]
    sponser_hash[:center_id] = params[:center_id]

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

end
