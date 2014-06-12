class PerformanceRecord < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  has_many   :ratings
  has_many   :users, through: :ratings


  def rating_count
    ratings.count
  end
end
