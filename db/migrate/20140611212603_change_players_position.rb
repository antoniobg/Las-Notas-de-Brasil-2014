class ChangePlayersPosition < ActiveRecord::Migration
  def up
    remove_column :players, :position
    add_column    :players, :position_id, :integer
  end

  def down
    remove_column :players, :position_id
    add_column    :players, :position, :string
  end
end
