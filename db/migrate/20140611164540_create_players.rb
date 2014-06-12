class CreatePlayers < ActiveRecord::Migration
  def up
    create_table :players do |t|
      t.string  :name
      t.integer :number
      t.string  :position
      t.integer :rating_count
      t.integer :rating_sum
      t.integer :minutes
      t.timestamps
    end
    add_index :players, :name
  end

  def down
    drop_table :players
  end
end
