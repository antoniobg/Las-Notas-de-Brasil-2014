class GamesController < ApplicationController
  before_action :user_is_admin,  except: [:index, :show]
  before_action :set_game,       except: [:index, :new, :create]
  before_action :set_records,    only:   :show
  before_action :set_rounds,     only:   [:new, :edit]

  def index
    conditions = get_conditions
    @games = Game.where(conditions).paginate(page: params[:page], per_page: 20 )
  end

  def show
  end

  def new
    @teams = Team.all.collect { |t| [t.name, t.id ] }
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:success] = "Game created successfully"
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  def edit
    @teams = Team.all.collect { |t| [t.name, t.id ] }
  end

  def update
    if @game.update_attributes(game_params)
      flash[:success] = "Game updated successfully"
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end

  def destroy
    @game.destroy
    flash[:success] = "Game #{@game} has been deleted successfully"
    redirect_to games_path
  end

  private

    def get_conditions
      conditions = {}
      conditions[:round] = params[:round] if params[:round]
      conditions[:published] = true unless signed_in_as_admin?
      conditions
    end

    def game_params
      params.require(:game).permit(:date, :round, :result, :home_team_id, :away_team_id, :published, :finished)
    end

    def set_game
      @game = Game.find(params[:id])
    end

    def set_records
      @home_records = @game.performance_records.where(as_home_player: true).order(:starting)
      @away_records = @game.performance_records.where(as_home_player: false).order(:starting)
    end

    def set_teams
      @home_team = Team.find(params[:game][:home_team_id])
      @away_team = Team.find(params[:game][:away_team_id])
    end

    def set_rounds
      @rounds = [["Grupo A", "Grupo A"], ["Grupo B", "Grupo B"], ["Grupo C", "Grupo C"], ["Grupo D", "Grupo D"], ["Grupo E", "Grupo E"], ["Grupo F", "Grupo F"], ["Grupo G", "Grupo G"], ["Grupo H", "Grupo H"], ["1/8", "1/8"], ["1/4", "1/4"], ["Semifinales", "Semifinales"], ["3º/4º", "3º/4º"], ["Final", "Final"]]
    end

end
