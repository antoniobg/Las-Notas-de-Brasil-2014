class AddStatsToTeams < ActiveRecord::Migration
  def up
    add_column :teams, :rating_sum,   :integer, default: 0
    add_column :teams, :rating_count, :integer, default: 0
    add_column :teams, :goals,        :integer, default: 0
    add_column :teams, :yellow_cards, :integer, default: 0
    add_column :teams, :red_cards,    :integer, default: 0
  end

  def down
    remove_column :teams, :rating_sum
    remove_column :teams, :rating_count
    remove_column :teams, :goals
    remove_column :teams, :yellow_cards
    remove_column :teams, :red_cards
  end
end
