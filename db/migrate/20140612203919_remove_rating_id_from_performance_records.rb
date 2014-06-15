class RemoveRatingIdFromPerformanceRecords < ActiveRecord::Migration
  def up
    remove_column :performance_records, :rating_id
  end

  def down
    add_column :performance_records, :rating_id, :integer
  end
end
