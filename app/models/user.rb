class User < ActiveRecord::Base
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

  has_secure_password
  vaidates :password, presence: true, length: { minimum: 6 }
end
