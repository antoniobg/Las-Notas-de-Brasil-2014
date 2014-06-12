class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string  :name
      t.string  :code
      t.integer :order

      t.timestamps
    end
    add_index :positions, :order
  end
end
