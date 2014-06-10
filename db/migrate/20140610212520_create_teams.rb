class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :iso_2

      t.timestamps
    end
  end
end
