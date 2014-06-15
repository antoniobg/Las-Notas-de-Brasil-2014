class AddIndexToPerformanceRecordsStarting < ActiveRecord::Migration
  def up
    add_index :performance_records, :starting
  end

  def down
    remove_index :performance_records, :starting
  end
end
