class Album < ApplicationRecord
  validates :title, :year, :style, presence: true
  validates :band_id, uniqueness: true

  belongs_to :band
  
  has_many :tracks, dependent: :destroy
end
