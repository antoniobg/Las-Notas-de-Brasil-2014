class TeamsController < ApplicationController
  before_action :user_is_admin,   except: [:index, :show]
  before_action :set_team,        except: [:index, :new, :create]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:success] = "Team created successfully"
      redirect_to teams_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @team.update_attributes(team_params)
      flash[:success] = "Team updated successfully"
      redirect_to team_path(@team)
    else
      render 'edit'
    end
  end

  def destroy
    @team.destroy
    flash[:success] = "Team '#{@team}' has been deleted successfully"
    redirect_to teams_path
  end

  private

    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :iso_2)
    end
end
