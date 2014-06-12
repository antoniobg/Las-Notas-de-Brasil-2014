class AddGoalsYellowCardsRedCardsToPlayers < ActiveRecord::Migration
  def up
    add_column :players, :goals,        :integer, default: 0
    add_column :players, :yellow_cards, :integer, default: 0
    add_column :players, :red_cards,    :integer, default: 0
  end

  def down
    remove_column :players, :goals
    remove_column :players, :yellow_cards
    remove_column :players, :red_cards
  end
end
