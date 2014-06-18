module GeneralHelper
  def total_games
    Game.where(finished: true).count
  end

  def total_goals
    Player.sum(:goals)
  end

  def total_yellow_cards
    Player.sum(:yellow_cards)
  end

  def total_red_cards
    Player.sum(:red_cards)
  end

  def total_rating_avg
    Rating.count.zero? ? 0 : (Rating.sum(:rating) / Rating.count.to_f)
  end
end