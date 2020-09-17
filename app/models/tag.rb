class Tag < ApplicationRecord
	validates :tag, presence: true, length: {maximum:99}

	has_and_belongs_to_many :memos, through: :memo_tags
	has_and_belongs_to_many :words

end
