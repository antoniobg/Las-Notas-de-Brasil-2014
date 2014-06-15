class ChangeDefaultValueFromMinutesInPerformanceRecords < ActiveRecord::Migration
  def change
    change_column :performance_records, :minutes, :integer, default: 90
  end
end
