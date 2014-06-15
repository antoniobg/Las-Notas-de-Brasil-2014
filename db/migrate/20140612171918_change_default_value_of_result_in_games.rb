class ChangeDefaultValueOfResultInGames < ActiveRecord::Migration
  def change
    change_column :games, :result, :string, default: nil
  end
end
