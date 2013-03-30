class ReviewsController < ApplicationController

  expose(:review)
  expose(:reviews) { Review.order("created_at").page(params[:page]).per(5)}

  def create
    if review.save
      redirect_to reviews_path, notice: "Your review has been submitted!"
      NotificationMailer.new_review(review).deliver
    else
      render :new
    end
  end

end
