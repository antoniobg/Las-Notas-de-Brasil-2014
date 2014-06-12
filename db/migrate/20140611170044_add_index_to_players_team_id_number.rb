class AddIndexToPlayersTeamIdNumber < ActiveRecord::Migration
  def change
    add_index :players, [:team_id, :number]
  end
end
