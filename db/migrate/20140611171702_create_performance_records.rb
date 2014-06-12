class CreatePerformanceRecords < ActiveRecord::Migration
  def change
    create_table :performance_records do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :rating_id
      t.integer :minutes

      t.timestamps
    end
    add_index :performance_records, :game_id
    add_index :performance_records, :player_id
  end
end
