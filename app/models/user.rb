class User < ActiveRecord::Base
  has_many :conversations

  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
