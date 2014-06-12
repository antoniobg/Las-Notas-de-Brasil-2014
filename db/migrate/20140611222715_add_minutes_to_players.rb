class AddMinutesToPlayers < ActiveRecord::Migration
  def up
    add_column :players, :minutes, :integer, default: 0
  end

  def down
    remove_column :players, :minutes
  end
end
