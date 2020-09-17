class Word < ApplicationRecord

  belongs_to :user
  has_many :word_tags, dependent: :destroy
  has_and_belongs_to_many :tags

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

  def self.search(search, word_or_memo_or_tag)
    if word_or_memo_or_tag == "1"
      Word.where(['name LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Word.all
    end
  end

end
