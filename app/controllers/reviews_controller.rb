class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    
#    @review.project_id = params[:projectid]
    logger.debug "STAGE reviews#create"
    @review.user_id = current_user.id
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to Project.find(@review.project_id), notice: 'review was successfully created.' }
      else
        format.html { render :new, notice: 'somethig went wrong X(' }
      end
    end
  end  

  def update
  end

  def destroy
    @review.destroy
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:user_id, :project_id, :review_pos, :review_neg)
    end
end
