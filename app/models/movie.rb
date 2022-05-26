class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, allow_blank: false, uniqueness: true
  validates :overview, presence: true, allow_blank: false
end
