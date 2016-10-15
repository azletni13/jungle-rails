class ReviewsController < ApplicationController

  def create

    @product = Product.find params['product_id']
    @user = current_user.id
    @new_review = @product.reviews.create(review_params)

    @product_id = params[:product_id]

    byebug
    if @new_review
      redirect_to "/products/#{@product_id}"
    else
      redirect_to "/products/#{@product_id}"
    end

  end

private

  def review_params

    new_params = params.require(:review).permit(:product_id,
                                  :user_id,
                                  :description,
                                  :rating
                                  )

    new_params['user_id'] = @user
    return new_params
  end
end
