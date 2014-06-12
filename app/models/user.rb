class User < ActiveRecord::Base
  has_many :ratings
  has_many :performance_records, through: :ratings
    
  def self.from_omniauth(auth)
    find_by(uid: auth["uid"]) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
      user.image = auth["info"]["image"]
    end
  end

  def to_s
    self.username
  end
end
