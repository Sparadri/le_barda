class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  # def create
  #   @product = Product.new(product_params)
  #   @product.save
  #   #TO DO - error message if error
  #   redirect_to product_path(@product)
  # end

  # def edit
  #   @product = Product.find(params[:id])
  # end

  # private

  # def product_params
  #   params.require(:product).permit(:collection_id, :is_live, :name, :description, :price, :picture, :shop_url)
  # end
end
