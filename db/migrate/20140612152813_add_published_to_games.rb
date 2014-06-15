class AddPublishedToGames < ActiveRecord::Migration
  def up
    add_column :games, :published, :boolean, default: false
  end

  def down
    remove_column :games, :published
  end
end
