class Track < ApplicationRecord
  validates :title, :ord, :lyrics, :album_id, :t_type, presence: true
  validates :album_id, uniqueness: true

  belongs_to :album
  has_one :band, through: :album, source: :band
  has_many :notes
end
