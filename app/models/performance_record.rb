class PerformanceRecord < ActiveRecord::Base
  # Relationships
  belongs_to :player
  belongs_to :game
  has_many   :ratings, dependent: :destroy
  has_many   :users, through: :ratings

  # Filters
  default_scope -> { order(:game_id, 'starting DESC', :player_id) }

  # Validation
  validates :player_id,      presence: true
  validates :game_id,        presence: true
  validates :minutes,        presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 120 }
  validates :goals,          presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :yellow_cards,   presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }
  validates :red_cards,      presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  def rate!(rating)
    self.rating_count += 1
    self.rating_sum += rating
    self.save if self.player.rate!(rating)
  end

  def rating_avg
    rating_count.zero? ? '-' : (rating_sum.to_f / rating_count).round(2)
  end

end
