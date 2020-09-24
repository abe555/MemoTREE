class Tag < ApplicationRecord
  validates :hashname, presence: true, length: {maximum:99}
  validates :user_id, presence: true

  has_and_belongs_to_many :words, through: :word_tags
  has_many :word_tags
  #has_many :words, through: :word_tags
  #has_many :word_relations, through: :word_tags, source: :word

  has_and_belongs_to_many :memos, through: :memo_tags
  has_many :memo_tags
  #has_many :memos, through: :memo_tags
  #has_many :memo_relations, through: :memo_tags, source: :memo

  belongs_to :user

  def self.search(search, sort_version, model_select)
    if model_select == "tag"
      if sort_version == "new"
        Tag.where(['hashname LIKE ?', "%#{search}%"]).order('created_at desc') 
      elsif sort_version == "old"
        Tag.where(['hashname LIKE ?', "%#{search}%"]).order('created_at asc')
      end

    else
      if sort_version == "new"
        Tag.all.order('created_at desc')
      elsif sort_version == "old"
        Tag.all.order('created_at asc')
      end
    end
  end
end
