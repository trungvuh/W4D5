class Sub < ApplicationRecord
  validates :title, :description, :user, presence: true

  belongs_to :moderator,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id,
    inverse_of: :subs
end
