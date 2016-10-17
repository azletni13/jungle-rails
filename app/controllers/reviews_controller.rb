class ReviewsController < ApplicationController


  def create

    @product = Product.find params['product_id']
    @user = current_user.id
    @new_review = @product.reviews.create(review_params)

    @product_id = params[:product_id]

    if @new_review && @new_review.description != ""
      flash[:review] = "Your review was successfully created. Thank you!"
      redirect_to "/products/#{@product_id}"
    else
      flash[:empty_review] = "Description field is empty!"
      redirect_to "/products/#{@product_id}"
    end

  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to "/products/#{params[:product_id]}"

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
