class Game < ActiveRecord::Base
  has_many :performance_records
  has_many :players, through: :performance_records

  # Filters
  before_save { self.name = name.titleize }
  before_save { iso_2.downcase! }
  default_scope -> { order('date') }

  # Validation
  validates :name, presence: true
  validates :home_team, presence: true, length: { is: 2 }
  validates :away_team, presence: true, length: { is: 2 }

end
