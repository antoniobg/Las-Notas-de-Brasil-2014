class AddAsHomePlayerToPerformanceRecords < ActiveRecord::Migration
  def up
    add_column :performance_records, :as_home_player, :boolean, default: true
  end

  def down
    add_column :performance_records, :as_home_player
  end
end
