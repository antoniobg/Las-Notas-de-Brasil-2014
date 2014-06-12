class CreateRatings < ActiveRecord::Migration
  def up
    create_table :ratings do |t|
      t.integer :performance_record_id
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
    add_index :ratings, :user_id
    add_index :ratings, :performance_record_id
  end
  
  def down
    drop_table :ratings
  end
end
