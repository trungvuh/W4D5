# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  sub_id     :integer          not null
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ApplicationRecord
  validates :sub, presence: true
  validates :sub_id, uniqueness: { scope: :post_id }

  belongs_to :sub, inverse_of: :post_subs
  belongs_to :post, inverse_of: :post_subs
end
