class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    @promotions = Promotion.all
    render json: @promotions
  end

  def show
    render json: @promotion
  end

  def create
    @promotion = Promotion.new(promotion_params)

    if @promotion.save
      render json: @promotion, status: :created
    else
      render json: { errors: @promotion.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @promotion.update(promotion_params)
      render json: @promotion
    else
      render json: { errors: @promotion.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @promotion.destroy
    head :no_content
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :description, :promotion_type)
  end

  def set_promotion
    @promotion = Promotion.find(params[:id])
  end

  def render_not_found_response
    render json: { error: 'Promotion not found' }, status: :not_found
  end
end
