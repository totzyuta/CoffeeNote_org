# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  provider    :string(255)      not null
#  uid         :string(255)      not null
#  nickname    :string(255)      not null
#  image_url   :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#  profile     :string(255)
#  fav_roaster :string(255)
#

class User < ActiveRecord::Base
  has_many :created_notes, class_name: 'Note', foreign_key: :uid
  has_many :notes

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]
    profile = auth_hash[:info][:description]

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.image_url = image_url
    end
  end

end
