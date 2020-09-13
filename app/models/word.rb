class Word < ApplicationRecord

  belongs_to :user
  has_many :word_tags, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true
  validates :body, presence: true



  enum color: {
  	green: 0,
  	red: 1,
  	blue: 2,
  	yellow: 3,
  	orange: 4,
  }

end
