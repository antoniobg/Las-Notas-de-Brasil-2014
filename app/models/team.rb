class Team < ActiveRecord::Base
  # Relationships
  has_many :players
  has_many :games_as_home_team, class_name: 'Game', foreign_key: 'home_team_id'
  has_many :games_as_away_team, class_name: 'Game', foreign_key: 'away_team_id'

  # Filters
  before_save { self.name = name.titleize }
  before_save { iso_2.downcase! }
  default_scope -> { order('name') }

  # Validation
  validates :name,  presence: true
  validates :iso_2, presence: true, length: { is: 2 }

  def games
    Game.where('home_team_id = ? OR away_team_id = ? AND finished = ?', self.id, self.id, true)
  end

  def games_played
    Game.where('home_team_id = ? OR away_team_id = ?', self.id, self.id).count
  end

  def add_performance_data!(data)
    return if data.nil?
    self.goals += data[:goals].to_i if data[:goals]
    self.yellow_cards += data[:yellow_cards].to_i if data[:yellow_cards]
    self.red_cards += data[:red_cards].to_i if data[:red_cards]
    self.save
  end

  def remove_performance_data!(data)
    return if data.nil?
    self.goals -= data[:goals].to_i if data[:goals]
    self.yellow_cards -= data[:yellow_cards].to_i if data[:yellow_cards]
    self.red_cards -= data[:red_cards].to_i if data[:red_cards]
    self.save
  end

  def rate!(rating)
    self.rating_sum += rating
    self.rating_count += 1
    self.save
  end

  def rating_avg
    rating_count.zero? ? '-' : (rating_sum.to_f / rating_count).round(2)
  end
  
  def to_s
    name
  end
end
