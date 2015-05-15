class User < ActiveRecord::Base
  has_many :event_attendings, :foreign_key => :event_attendee_id, dependent: :destroy
  has_many :attended_events, :through => :event_attendings, :source => :attended_event
  
  has_many :created_events, :foreign_key => "creator_id", :class_name => "Event", dependent: :destroy

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

  scope :starts_after, ->(time) { where("starts_at >= ?", time) }
  scope :starts_before, ->(time) { where("starts_at < ?", time) }
 


  #create class method for testing - fixtures
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
