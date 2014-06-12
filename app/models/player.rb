class Player < ActiveRecord::Base

  # Relationships
  belongs_to :team
  has_many   :performance_records
  has_many   :games, through: :performance_records
  belongs_to :position

  # Filters
  default_scope -> { order('position_id', 'number') }

  # Validations
  validates :team_id, presence: true

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
