class AddRatingCountToPerformanceRecords < ActiveRecord::Migration
  def up
    add_column :performance_records, :rating_count, :integer, default: 0
  end

  def down
    remove_column :performance_records, :rating_count
  end
end
