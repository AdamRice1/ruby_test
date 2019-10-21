class Song < ApplicationRecord
  belongs_to :user
  validates :artist, presence: true, length: { in: 2..20 }
  validates :title, presence: true, length: { in: 2..50}

  has_many :adds, dependent: :destroy
  has_many :users, through: :adds, source: :user

end
