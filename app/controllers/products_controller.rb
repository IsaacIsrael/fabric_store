class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]
  before_action :set_product, only: [:show]

  def index
    @products = Product.all.page(params[:page]).per(20)
  end

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end
end
