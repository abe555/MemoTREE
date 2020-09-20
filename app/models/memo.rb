class Memo < ApplicationRecord

  belongs_to :user
  has_many :memo_tags, dependent: :destroy
  has_many :tags, through: :memo_tags

  validates :user_id, presence: true
  validates :body, presence: true

  enum color: {
  	green: 0,
  	red: 1,
  	blue: 2,
  	yellow: 3,
  	gray: 4,
  }

#ハッシュタグ登録機能関係

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
    memo.tags.clear
    tags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)

    tags.uniq.map do |t|
      hashtag = Tag.find_or_create_by(hashname: t.downcase.delete('#'))
      memo.tags << hashtag
    end
  end

#検索機能

  def self.search(search, sort_version, model_select)
    if model_select == "memo"
      if sort_version == "new"
        Memo.where(['body LIKE ?', "%#{search}%"]).order("created_at desc")
      elsif sort_version == "old"
        Memo.where(['body LIKE ?', "%#{search}%"]).order("created_at asc")
      elsif sort_version == "pickup"
        Memo.where(['body LIKE ?', "%#{search}%"])
      end

    else
      if sort_version == "new"
        Memo.all.order("created_at desc")
      elsif sort_version == "old"
        Memo.all.order("created_at asc")
      elsif sort_version == "pickup"
        Memo.all
      end
    end
  end

end
