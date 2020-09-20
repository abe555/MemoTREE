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
    gray: 4,
  }

  def self.search(search, sort_version, model_select)
    if model_select == "word"
      if sort_version == "new"
        Word.where(['name LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"]).order('created_at desc')
      elsif sort_version == "old"
        Word.where(['name LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"]).order('created_at asc')
      elsif sort_version == "pickup"
        Word.where(['name LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"])
      end

    else
      if sort_version == "new"
        Word.all.order('created_at desc')
      elsif sort_version == "old"
        Word.all.order('created_at asc')
      elsif sort_version == "pickup"
        Word.all
      end
    end
  end

end
