class Memo < ApplicationRecord

  belongs_to :user
  has_and_belongs_to_many :tags, through: :memo_tags

  validates :user_id, presence: true
  validates :body, presence: true

  enum color: {
  	green: 0,
  	red: 1,
  	blue: 2,
  	yellow: 3,
  	orange: 4,
  }

  # tag登録機能関係
  after_create do
    memo = Memo.find_by(id: self.id)
    tags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)

    tags.uniq.map do |t|
      hashtag = Tag.find_or_create_by(hashname: t.downcase.delete('#'))
      memo.tags << hashtag
    end
  end

  before_update do
    memo = Memo.find_by(id: self.id)
    tag.tags.clear
    hashtags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |t|
      hashtag = Tag.find_or_create_by(hashname: tag.downcase.delete('#'))
      memo.tags << hashtag
    end
  end

  def self.search(search, word_or_memo_or_tag)
    if word_or_memo_or_tag == "2"
      Memo.where(['body LIKE ?', "%#{search}%"])
    else
      Memo.all
    end
  end

end
