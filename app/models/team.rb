class Team < ActiveRecord::Base
  # Relationships
  has_many :players

  # Filters
  before_save { self.name = name.titleize }
  before_save { iso_2.downcase! }
  default_scope -> { order('name') }

  # Validation
  validates :name, presence: true
  validates :iso_2, presence: true, length: { is: 2 }

  def rating_avg
    rating_sum = players.inject(0) { |sum, player| sum + player.rating_avg }
    rating_sum / players.length
  end
  def to_s
    name
  end
end
