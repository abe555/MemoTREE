class Word < ApplicationRecord

  belongs_to :user
  has_many :word_tags, dependent: :destroy
  has_many :tags, through: :word_tags, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true
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
    word = Word.find_by(id: self.id)
    tags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)

    tags.uniq.map do |t|
      hashtag = Tag.find_or_create_by(hashname: t.downcase.delete('#'))
      byebug
      word.tags << hashtag
    end
  end

  before_update do
    word = Word.find_by(id: self.id)
    word.tags.clear
    tags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)

    tags.uniq.map do |t|
      hashtag = Tag.find_or_create_by(hashname: t.downcase.delete('#'))
      word.tags << hashtag
    end
  end


  def self.search(search, sort_version, model_select)
    if model_select == "word"
      if sort_version == "new"
        Word.where(['name LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"]).order('created_at desc')
      elsif sort_version == "old"
        Word.where(['name LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"]).order('created_at asc')
      end

    else
      if sort_version == "new"
        Word.all.order('created_at desc')
      elsif sort_version == "old"
        Word.all.order('created_at asc')
      end
    end
  end

end
