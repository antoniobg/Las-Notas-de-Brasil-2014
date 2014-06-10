class User < ActiveRecord::Base
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
end
