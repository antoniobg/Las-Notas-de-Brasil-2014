class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :uid
      t.string :image
      t.string :provider

      t.timestamps
    end
  end
end
