class AddRatingAttributesToPerformanceRecords < ActiveRecord::Migration
  def up
    add_column :performance_records, :rating_sum, :integer
  end
  def down
    remove_column :performance_records, :rating_sum
  end
end
