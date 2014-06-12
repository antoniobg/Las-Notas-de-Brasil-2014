class AddRatingAttributesToPlayer < ActiveRecord::Migration
  def up
    add_column :players, :rating_sum,   :integer, default: 0
    add_column :players, :rating_count, :integer, default: 0
  end

  def down
    remove_column :players, :rating_sum
    remove_column :players, :rating_count
  end
end
