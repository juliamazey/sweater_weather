class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email, uniqueness: true, presence: true, require: true
  validates_presence_of :api_key, uniqueness: true, presence: true, require: true
  validates_presence_of :password, require: true
end
