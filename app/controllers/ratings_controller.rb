class RatingsController < ApplicationController
  before_action :signed_in_user
  before_action :set_record

  def create
    @rating = Rating.new(rating_params)
    @rating.performance_record = @record
    @rating.user = current_user
    if @rating.valid? and @record.rate!(params[:rating][:rating].to_i) and @rating.save
      respond_to do |format|
        format.js do
          @rating
          render 'new_rating'
        end
      end
    else
      respond_to do |format|
        format.js   { render 'new_rating_errors', object: @rating }
      end
    end
  end

  def index
    
  end

  private

    def rating_params
      params.require(:rating).permit(:rating)
    end

    def set_record
      @record = PerformanceRecord.find(params[:performance_record_id])
    end

end
