class AddTeamIdToPlayers < ActiveRecord::Migration
  def up
    add_column :players, :team_id, :integer
  end

  def down
    remove_column :players, :team_id
  end
end
