class Rating < ActiveRecord::Base
  # Relationships
  belongs_to :performance_record
  belongs_to :user

  # Validation
  validates :performance_record_id, presence: true
  validates :user_id,               presence: true, uniqueness:   { scope: :performance_record_id }
  validates :rating,                presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
