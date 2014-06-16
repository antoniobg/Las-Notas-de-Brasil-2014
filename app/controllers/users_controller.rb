class UsersController < ApplicationController
  before_action :set_user
  
  def show
    @games = Game.joins(performance_records: :ratings).where("ratings.user_id" => @user.id).group("games.id").paginate(page: params[:page], per_page: 20 )
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
