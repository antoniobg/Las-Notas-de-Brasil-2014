class AddGoalsYellowCardsRedCardsToPerformanceRecords < ActiveRecord::Migration
  def up
    add_column :performance_records, :goals,        :integer, default: 0
    add_column :performance_records, :yellow_cards, :integer, default: 0
    add_column :performance_records, :red_cards,    :integer, default: 0
  end

  def down
    remove_column :performance_records, :goals
    remove_column :performance_records, :yellow_cards
    remove_column :performance_records, :red_cards
  end
end
