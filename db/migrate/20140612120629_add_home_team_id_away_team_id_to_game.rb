class AddHomeTeamIdAwayTeamIdToGame < ActiveRecord::Migration
  def up
    remove_column :games, :home_team
    remove_column :games, :away_team 
    add_column :games, :home_team_id, :integer
    add_column :games, :away_team_id, :integer
  end

  def down
    remove_column :games, :home_team_id
    remove_column :games, :away_team_id
  end
end
