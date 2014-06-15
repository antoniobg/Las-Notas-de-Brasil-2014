class Game < ActiveRecord::Base
  has_many :performance_records
  has_many :players, through: :performance_records
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  
  # Filters
  default_scope -> { order('date DESC') }

  # Validation
  validates :date,         presence: true
  validates :home_team_id, presence: true
  validates :away_team_id, presence: true
  validates :round,        presence: true

  def home_players
    players.where(team_id: home_team_id)
  end

  def away_players
    players.where(team_id: away_team_id)
  end

  def publish!
    self.update_attributes(published: true)
  end

  def unpublish!
    self.update_attributes(published: false)
  end

  def finish!
    self.update_attributes(finished: true)
  end

  def unfinish!
    self.update_attributes(finished: false)
  end

  def to_s
    if result.blank?
      "#{home_team} - #{away_team}"
    else
      "#{home_team} #{result} #{away_team}"
    end
  end
end
