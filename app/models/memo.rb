class Memo < ApplicationRecord

  belongs_to :user
  has_many :memo_tags, dependent: :destroy

  validates :user_id, presence: true
  validates :body, presence: true
end
