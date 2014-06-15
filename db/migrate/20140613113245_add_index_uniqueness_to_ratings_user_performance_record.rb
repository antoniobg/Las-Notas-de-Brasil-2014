class AddIndexUniquenessToRatingsUserPerformanceRecord < ActiveRecord::Migration
  def change
    add_index :ratings, [:user_id, :performance_record_id], unique: true
  end
end
