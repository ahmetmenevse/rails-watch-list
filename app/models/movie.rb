class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true
  validates :overview, uniqueness: true, presence: true
end
