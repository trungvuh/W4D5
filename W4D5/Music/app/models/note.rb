class Note < ApplicationRecord
  validates :content, :track_id, :user_id, presence: true
  validates :track_id, :user_id, uniqueness: true

  belongs_to :track
  belongs_to :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id
end
