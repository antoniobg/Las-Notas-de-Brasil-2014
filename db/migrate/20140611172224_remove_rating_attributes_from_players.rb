class RemoveRatingAttributesFromPlayers < ActiveRecord::Migration
  def up
    remove_column :players, :rating_sum
    remove_column :players, :rating_count
    remove_column :players, :minutes
  end
end
