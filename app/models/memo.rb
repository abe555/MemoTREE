class Memo < ApplicationRecord

  belongs_to :user
  has_many :memo_tags, dependent: :destroy

  validates :user_id, presence: true
  validates :body, presence: true

  enum color: {
  	green: 0,
  	red: 1,
  	blue: 2,
  	yellow: 3,
  	orange: 4,
  }

  def self.search(search, word_or_memo_or_tag)
    if word_or_memo_or_tag == "2"
      Memo.where(['body LIKE ?', "%#{search}%"])
    else
      Memo.all
    end
  end

end
