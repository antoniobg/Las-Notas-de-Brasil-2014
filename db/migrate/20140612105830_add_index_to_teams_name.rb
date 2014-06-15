class AddIndexToTeamsName < ActiveRecord::Migration
  def up
    add_index :teams, :name
  end

  def down
    remove_index :teams, :name
  end
end
