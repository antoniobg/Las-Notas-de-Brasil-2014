class PlayersController < ApplicationController
  before_action :user_is_admin,   except: [:index, :show]
  before_action :set_player,      except: [:index, :new, :create]
  before_action :set_team,        except: :index
  before_action :set_positions,   only:   [:new, :edit]

  def index
    @players = if params[:position]
      Player.find_all_by_position_id(params[:position])
    else
      Player.all
    end.paginate(page: params[:page], per_page: 30 )
  end

  def new
    @positions = Position.all.collect { |p| [p.code, p.id ] }
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.team = @team
    if @player.save
      flash[:success] = "Player #{@player} created successfully"
      redirect_to team_path(@player.team)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @player.update_attributes(player_params)
      flash[:success] = "Player updated successfully"
      redirect_to team_player_path(@team,@player)
    else
      render 'edit'
    end
  end

  def destroy
    @player.destroy
    flash[:success] = "Player #{@player} has ben deleted successfully"
    redirect_to @player.team
  end


  private

    def set_positions
      @positions = Position.all.collect { |p| [p.code, p.id ] }
    end

    def set_team
      @team = Team.find(params[:team_id])
    end

    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:name, :number, :position_id, :team_id)
    end
end
