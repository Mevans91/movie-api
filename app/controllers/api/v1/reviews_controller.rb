class Api::V1::ReviewsController < ApplicationController

    def index
        @reviews = Review.all
        render json: @reviews
    end

    def show
        render json: @reviews 
    end

    def create
        @review=Review.new(review_params)
        if @review.save
            render json: @review, status: created
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

    def update
        if @review.update(review_params)
            render json: @review
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @review.destroy
    end

    private

    def set_reviews
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:body, :movie_id, :user_id, :rating)
    end



end
