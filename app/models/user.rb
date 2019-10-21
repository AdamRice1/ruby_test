class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, length: { in: 8..50 }
  has_many :songs
  has_many :add, dependent: :destroy
  has_many :songs_added, through: :adds, source: :songs
  before_save :check_length
  
  private
  def check_length
    validates_length_of :password, presence: true, minimum: 8
  end
end

