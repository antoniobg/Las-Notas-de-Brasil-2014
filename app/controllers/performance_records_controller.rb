class PerformanceRecordsController < ApplicationController
  before_action :user_is_admin
  before_action :set_record, only:   :destroy
  before_action :set_game,   except: :destroy

  def new
    @players = (@game.home_team.players + @game.away_team.players).collect { |p| ["#{p.number} - #{p.position} - #{p.name}", p.id ] }
    @record = PerformanceRecord.new
  end

  def create
    @record = PerformanceRecord.new(record_params)
    @record.game = @game
    @record.player.add_performance_data!(stats_params)
    if @record.save
      flash[:success] = "Record created successfully"
      redirect_to @game
    else
      @record.player.remove_performance_data!(stats_params)
      @players = (@game.home_team.players + @game.away_team.players).collect { |p| ["#{p.number} - #{p.position} - #{p.name}", p.id ] }
      render 'new'
    end
  end

  def destroy
    @record.destroy
    player = @record.player
    performance_data = { 
      goals: player.goals, 
      minutes: player.minutes, 
      yellow_cards: player.yellow_cards,
      red_cards: player.red_cards
    }
    @record.player.remove_performance_data!(performance_data)
  end

  private

    def set_game
      @game = Game.find(params[:game_id])
    end

    def set_record
      @record = PerformanceRecord.find(params[:id])
    end

    def record_params
      params.require(:performance_record).permit(:game_id, :player_id, :goals, :minutes, :yellow_cards, :red_cards, :starting, :as_home_player )
    end

    def stats_params
      params.require(:performance_record).permit(:goals, :minutes, :yellow_cards, :red_cards)
    end
end
