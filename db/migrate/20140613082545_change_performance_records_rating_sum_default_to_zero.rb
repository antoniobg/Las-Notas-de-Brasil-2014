class ChangePerformanceRecordsRatingSumDefaultToZero < ActiveRecord::Migration
  def change
    change_column :performance_records, :rating_sum, :integer, default: 0
  end
end
