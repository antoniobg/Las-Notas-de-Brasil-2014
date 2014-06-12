class AddTeamCodeToGames < ActiveRecord::Migration
  def up
    add_column :games, :home_team, :string
    add_column :games, :away_team, :string
  end

  def down
    remove_column :games, :home_team
    remove_column :games, :away_team
  end
end
