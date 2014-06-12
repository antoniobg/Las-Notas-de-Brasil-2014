class UpdatePositionsOrder < ActiveRecord::Migration
  def up
    remove_column :positions, :order 
    add_column    :positions, :priority, :integer
  end

  def down
    remove_column :positions, :priority
    add_column    :positions, :order, :integer
  end
end
