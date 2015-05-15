class User < ActiveRecord::Base
  before_save { email.downcase! }
  before_save { name.rstrip! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A[a-z]+/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :name, presence: true, length: { minimum: 3, maximum: 18 }, format: { with: VALID_NAME_REGEX }
end
