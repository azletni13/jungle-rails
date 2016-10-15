class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end


  def show
    @product = Product.find params[:id]
    hst_price = @product.price_cents * 1.13/100
    hst_price.round(2)
    @reviews = Review.where(product_id: params[:id]).order(created_at: :desc)
    @review = Review.new()
    @user = current_user.first_name
  end

end
