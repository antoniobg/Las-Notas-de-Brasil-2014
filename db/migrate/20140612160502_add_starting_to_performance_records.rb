class AddStartingToPerformanceRecords < ActiveRecord::Migration
  def up
    add_column :performance_records, :starting, :boolean, default: true
  end

  def down
    remove_column :performance_records, :starting
  end
end
