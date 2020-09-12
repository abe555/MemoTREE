class Memo < ApplicationRecord

  belongs_to :user
  has_many :memo_tags, dependent: :destroy

  validates :user_id, presence: true
  validates :body, presence: true

  enum status: {
  	green: 0,
  	red: 1,
  	blue: 2,
  	yellow: 3,
  	orange: 4,
  }


end
