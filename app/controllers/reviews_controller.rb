class ReviewsController < ApplicationController

  expose(:review)
  expose(:reviews) { Review.order("featured").page(params[:page]).per(5)}

  layout 'pages'

  def show
  end

  def create
    if review.save
      redirect_to reviews_path, notice: "Your review has been submitted!"
      NotificationMailer.new_review(review).deliver
    else
      render :new
    end
  end

end
