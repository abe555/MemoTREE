class Tag < ApplicationRecord
	validates :hashname, presence: true, length: {maximum:99}

	has_and_belongs_to_many :memos, through: :memo_tags
	has_and_belongs_to_many :words, through: :word_tags

end
