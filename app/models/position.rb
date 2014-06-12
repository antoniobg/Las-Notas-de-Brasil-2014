class Position < ActiveRecord::Base
  has_many :players

  # Filters
  before_save { name.capitalize! }
  before_save { code.upcase! }
  default_scope -> { order('priority') }

  # Validation
  validates :name,  presence: true
  validates :code,  presence: true, length: { minimum: 2, maximum: 3 }
  validates :priority, presence: true

  def to_s
    code
  end
end
