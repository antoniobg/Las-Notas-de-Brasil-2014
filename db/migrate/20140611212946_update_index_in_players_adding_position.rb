class UpdateIndexInPlayersAddingPosition < ActiveRecord::Migration
  def up
    remove_index :players, [:team_id, :number]
    add_index    :players, [:team_id, :position_id, :number]
  end  

  def down
    remove_index :players, [:team_id, :position_id, :number]
    add_index    :players, [:team_id, :number]
  end
end
