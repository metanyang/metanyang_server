class SponsershipsController < ApplicationController
  before_action :set_sponsership, only: [:update, :results]

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


  def results
    image = params[:image]
    puts image
    if image.present?
      uploader = ImageUploader.new
      uploader.store! image
      result_hash = {image: uploader.url, content: params[:content]}
    else
      result_hash = {content: params[:content]}
    end

    @result_mail = @sponsership.result_mails.create(result_hash)

    @result = ResultMailer.result_mail(@result_mail).deliver_now
    if @result.errors == []
      @result = @result_mail.as_json
      @result["full_image"] = "http://jinhyuk.me:3333#{@result_mail.image}"
      render json: @result, status: :ok
    else
      render json: @result.errors, status: :internal_server_error
    end
  end

  private

  def set_sponsership
    @sponsership = Sponsership.find(params[:id])
  end
end
