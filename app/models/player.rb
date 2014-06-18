class Player < ActiveRecord::Base

  # Relationships
  belongs_to :team
  has_many   :performance_records
  has_many   :games, through: :performance_records
  belongs_to :position

  # Filters
  default_scope -> { order('team_id, position_id', 'number') }

  # Validations
  validates :team_id, presence: true

  def add_performance_data!(data)
    return if data.nil?
    self.goals += data[:goals].to_i if data[:goals]
    self.minutes += data[:minutes].to_i if data[:minutes]
    self.yellow_cards += data[:yellow_cards].to_i if data[:yellow_cards]
    self.red_cards += data[:red_cards].to_i if data[:red_cards]
    self.save if self.team.add_performance_data!(data)
      
  end

  def remove_performance_data!(data)
    return if data.nil?
    self.goals -= data[:goals].to_i if data[:goals]
    self.minutes -= data[:minutes].to_i if data[:minutes]
    self.yellow_cards -= data[:yellow_cards].to_i if data[:yellow_cards]
    self.red_cards -= data[:red_cards].to_i if data[:red_cards]
    self.save if self.team.remove_performance_data!(data)
  end

  def rate!(rating)
    self.rating_sum += rating
    self.rating_count += 1
    self.save if self.team.rate!(rating)
  end

  def rating_avg
    !rating_count.zero? ? (rating_sum.to_f / rating_count).round(2) : 0
  end

  def games_played
    games.count
  end

  def to_s
    name
  end
end
