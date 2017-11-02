# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, :moderator, presence: true

  has_many :post_subs, inverse_of: :sub, dependent: :destroy
  has_many :posts, through: :post_subs, source: :post, inverse_of: :subs
  # has_many :posts, inverse_of: :sub

  belongs_to :moderator,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id,
    inverse_of: :subs
end
