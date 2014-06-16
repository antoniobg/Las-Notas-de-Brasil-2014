class RatingsController < ApplicationController
  before_action :signed_in_user, only: :create
  before_action :set_record,     only: :create
  before_action :set_user,       only: :index
  before_action :set_game,       only: :index
  before_action :set_records,    only: :index

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

    def set_game
      @game = Game.find(params[:game_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_records
      @home_records = @game.performance_records.where(as_home_player: true).order(:starting)
      @away_records = @game.performance_records.where(as_home_player: false).order(:starting)
    end

end
