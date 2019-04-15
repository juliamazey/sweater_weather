class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :api_key
  validates_uniqueness_of :api_key
  validates_presence_of :password

  has_many :favorites
  has_many :locations, through: :favorites

  def self.create_new(user_params)
    user = User.new(user_params)
    user.api_key = self.get_key
    return user
  end

  def self.get_key
    SecureRandom.urlsafe_base64
  end

end
