class AddResultToGames < ActiveRecord::Migration
  def up
    add_column :games, :result, :string, default: "Por jugar"
  end

  def down
    remove_column :games, :result
  end
end
