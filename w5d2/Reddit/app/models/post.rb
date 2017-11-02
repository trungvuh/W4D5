# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :subs, :author, presence: true

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub, inverse_of: :posts
  has_many :comments, dependent: :destroy, inverse_of: :post
  # belongs_to :sub, inverse_of: :posts

  belongs_to :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id,
    inverse_of: :posts
end
