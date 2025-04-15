class BusinessesController < ApplicationController
  before_action :set_business, only: [ :show, :update, :destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    @businesses = Business.all
    render json: @businesses
  end

  def show
    render json: @business
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      render json: @business, status: :created
    else
      render json: { errors: @business.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @business.update(business_params)
      render json: @business
    else
      render json: { errors: @business.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @business.destroy
    head :no_content
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :phone, :email, :website)
  end

  def set_business
    @business = Business.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Business not found" }, status: :not_found
  end
end
