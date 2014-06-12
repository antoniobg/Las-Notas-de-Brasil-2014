class Rating < ActiveRecord::Base
  belongs_to :performance_record
  belongs_to :user
end
